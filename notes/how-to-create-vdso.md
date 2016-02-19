Creating a vDSO: the Colonel’s Other Chicken
============================================

Feb 06, 2012	 By Matt Davis

A vDSO (virtual dynamic shared object) is an alternative to the
somewhat cycle-expensive system call interface that the GNU/Linux kernel
provides. But, before I explain how to cook up your own vDSO, in this
brief jaunt down operating system lane, I cover some basics of vDSOs,
what they are and why they are useful. The main purpose of this article
is to illustrate how to add a custom vDSO to a Linux kernel and then
how to use the fruits of your labor. This is not intended to be a vDSO
101; if you would like more in-depth information, see the links in the
Resources section of this article.

## vDSO Basics

The traditional mechanism of communication between userland applications
and the kernel is something called a system call. Syscalls are implemented
as software interrupts providing the userland application with some
kernel functionality. For instance, gettimeofday() and fork() are both
system calls. The reason syscalls exist is due to the fact that the
Linux kernel is divided into two primary segments of memory: userland
and kernel land. Userland is where common programs, including dæmons
and servers, execute. Kernel land is where the kernel schedules processes
and does all of its nifty kernel-specific magic. This division in memory
acts as a safety barrier between user applications and the kernel. The
only way a user application even can touch the kernel is via system call
communication. Therefore, the robustness and integrity of the kernel is
protected by the limited set of routines it provides userland access to,
the system calls.

To accomplish a syscall, the kernel must flip-flop memory contexts:
storing the userland CPU registers, looking up the syscall in the
interrupt vector of syscalls (the syscall vector is initialized at
boot time) and then processing the syscall. Once the syscall has been
processed in kernel land, the kernel must restore the registers from the
previously stored userland context. This completes the syscall; however,
as you can imagine, this is not a tax-free series of events. Numerous
cycles are spun just to make these special kinds of function calls.

Although this segmentation sounds great for the security world, it does
not always provide the most efficient means of communication. Certain
functions that do not write any data and merely return a value stored
in the kernel, such as gettimeofday(), are relatively safe in nature
and provide no threat to the kernel from the requesting userland
application. Wouldn’t it be nice if you could make safe functions not
have to do the memory-barrier tango? Well, you can—with vDSO!

You’re probably wondering how a vDSO gets placed into a program in
the first place, over the traditional syscall. Well, vDSO hooks are
provided via the glibc library. The linker will link in the glibc
vDSO functionality, provided that such a routine has an accompanying
vDSO version, such as gettimeofday(). When your program executes, if
your kernel does not have vDSO support, a traditional syscall will be
made. This test of vDSO functionality is provided by the code linked from
glibc. Of course, you don’t want to hack up glibc just so you can have
your home-brewed vDSO run. The method for creating a vDSO described below
does not require modification of glibc; instead it relies on hacking up
the kernel, as expected.

Cluck, Cluck...vDSO

These safe syscalls can be implemented on a page of virtual memory that
can be mapped into each running process’ memory. This implementation
is similar to how other dynamically shared objects are mapped into a
process, such as shared libraries. In fact, if you were to extract the
page from memory and disassemble it, the result is a shared-library
ELF. In other words, the vDSO is just a shared library (sorry to blow
the magic for you). With this page of safe syscall routines resident
to the userland application, a program can make the call and not have
to endure the overhead of the memory-hopping between user and kernel
segments that a traditional syscall would require. One perfect example
is gettimeofday(). This routine not only is timing-sensitive, but it
often is a routine that is used at a high frequency. Consider that it
takes the kernel time to hop memory segments. Once the clock is sampled,
cycles must be spent to flip memory segments. The longer this takes,
the less accurate the returned time value will be.

## Let’s Get Frying

Enough with theory and all that mumbo-jumbo, let’s get to what this
article is all about—making your own vDSO. This article assumes a
64-bit x86 processor using the 2.6.37 Linux kernel. You’ll probably
be surprised at how easy this is. It is even less involved than making a
traditional syscall. The confusing part comes when trying to share data
via variables between kernel and userland.

Let’s create a syscall that does something basic—say, produce an
integer value of, oh, the number of the beast, 666. For all instructive
purposes, let’s call this function, number_of_the_beast(). Because
I’m not sure that the true number of the beast is static (hey,
beasts might change), let’s make this function do just that, tell
us the number of the beast. (It could be like a president and change
every few years.) Create a file in linux-2.6.37/arch/x86/vdso/ called
vnumber_of_the_beast.c, and inside there, define your function:

```
#include <asm/linkage.h>

notrace int __vdso_number_of_the_beast(void)
{
    return 0xDEAD - 56339;
}
```

The only interesting/unusual thing here is the notrace macro. It is
defined in linux-2.6.37/arch/x86/include/asm/linkage.h as being:

```C
#define notrace __attribute__((no_instrument_function))
```

The above GNU extension tells the gcc compiler that when it compiles
the function to exclude hooks supporting profiling feedback. Profiling
feedback can be built in, if the notrace macro is removed and if the
gcc flag -finstrument-functions was passed to the gcc at compile time
(see the GCC Manual, listed in Resources).

You also need to tell the compiler to link a userland-accessible
function called number_of_the_beast, which is also a weak symbol. Weak
symbols represent data, such as function calls, that do not resolve until
runtime. The word "weak" simply means the symbol can be overridden. If the
symbol does not exist, no warnings are issued, as no symbol is acceptable
in this case. The alias associates the local __vdso_number_of_the_beast
to the world-accessible version, number_of_the_beast. Add the following
piece just after the function previously added:

```
int number_of_the_beast(void)
    __attribute__((weak, alias("__vdso_number_of_the_beast")));
```

Now, you just need to toss in some pieces to the linker script so that
when the kernel builds, your code will get built and linked into the
vdso.so shared object. That is what you will use for your hook when
writing code that uses the vDSO. Now, bust out your text editor and
modify linux-2.6.37/arch/x86/vdso/vdso.lds.S to add the function names
you just added:


```
VERSION {
    LINUX_2.6 {
        global:
            clock_gettime;
            __vdso_clock_gettime;
            gettimeofday;
            __vdso_gettimeofday;
            getcpu;
            __vdso_getcpu;

            /* ADD YOUR VDSO STUFF HERE */
            number_of_the_beast;
            __vdso_number_of_the_beast;
        local: *;
    };
}
```

One more thing, you need to tell the compiler actually to
compile the information in vnumber_of_the_beast.c. To do
this, just toss some information into the Makefile located in
linux-2.6.37/arch/x86/vdso/Makefile. Add the name of the file, with
a .o instead of a .c extension. And, through make wizardry and black
magic, it will be compiled at compile time. Again, break out the text
editor, and add the name to the list of object files for the variable
vobjs-y. Your result should look something similar to the following:


```
# files to link into the vdso
vobjs-y := vdso-note.o vclock_gettime.o vgetcpu.o 
 ↪vvar.o vnumber_of_the_beast.o

```

And Now Some Special Sauce

If the vDSO is operating in userland, how do you access kernel-land
variables? After all, if vDSOs are supposed to provide kernel
information, don’t they have to trip the userland/kernel-land memory
segment? And, wouldn’t that flip-flopping of memory context render
a vDSO useless? Well, it all depends how the userland version, the
vDSO version, accesses the kernel data. For gettimeofday(), a special
time variable is mapped into memory where the kernel updates it and
the userland (vDSO version) can read it. The kernel merely copies what
it knows about time into that variable, and when a vDSO is made, that
call just reads the information saving the overhead of crossing memory
segments. The addition or access of a kernel variable is fairly involved
as compared to a basic vDSO function, but because the purpose of a vDSO
is to access kernel information, such as that provided in variables,
I probably should give a quick overview of doing that.

For illustrative purposes, let’s add a value that lives in kernel land
but is read from userland. Sure, I said earlier that this mystical number
might change and you should implement a function to return it. Well,
you have a function, but all you know now is the value and not what it
might change to in the future. Let’s make the function return a value,
nonconstant. Wow, this use case is becoming really unusual. To elaborate,
let’s update this variable as the kernel requests. The kernel will
update the vDSO variables in the update_vsyscall() function located in
linux-2.6.37/arch/x86/kernel.

If you were to declare it const int vnotb = 666;, the value captured
there would not be set (more on this later).

Let’s define the value to be, in fact, the mysterious number of
the beast itself, which I will call vnotb. This number will reside in
kernel land, as so many other useful values, such as time, which the
efficient gettimeofday() vDSO will obtain. This is where the true magic
of vDSOs lie.

Let’s remain in linux-2.6.37/arch/x86/vdso and modify all the goodies
here. First, declare the variable via the VEXTERN() macro. In vextern.h,
add your declaration alongside all the other declarations:

```
VEXTERN(vnotb)
```

This macro will create a variable that is a pointer to the value you
care about and is prefixed with vdso_. In essence, you have declared
vnotb as int *vdso_vnotb;.

vextern.h mentions that:

Any kernel variables used in the vDSO must be exported in the main
kernel’s vmlinux.lds.S/vsyscall.h/proper__section and put into vextern.h
and be referenced as a pointer with vdso prefix. The main kernel later
fills in the values (comment in linux-2.6.37/arch/x86/vdso/vextern.h).

Now that you have some of the vDSO code in place, the userland stuff
and the kernel-userland mapping, let’s make use of it. In the function
vget_number_of_the_beast(), let’s return the value:

```
notrace int __vdso_number_of_the_beast(void)
{
    return *vdso_vnotb;
}
```

Don’t forget to add the header that declares that value, vextern.h as
well as an additional header that will resolve some data referenced by
the latter, vgtod.h:

```
#include <asm/vgtod.h>
#include "vextern.h"
```

To wrap things up, you need to let the kernel know about this variable
so it can pump data into it. You need the kernel to give userland a
value. Well, you have it mapped at the address specified above, but that
is rather pointless, unless Mr Sanders, the colonel, doesn’t push some
data into it. You need to go up one directory (yes, this isn’t the
most trivial of processes). Hop into linux-2.6.37/arch/x86/kernel. You
need to let the linker know of this value, so it can map between kernel
and userland, so you probably should rock that. Modify vmlinux.lds.S,
and add the following after the vgetcpu_mode piece (note that adding
it after or before vgetcpu_mode isn’t necessary, but it’s an easy
place to find things):

```
.vnotb : AT(VLOAD(.vnotb)) {
        *(.vnotb)
}

vnotb = VVIRT(.vnotb);
```

This links the vnotb symbol with the variable vnotb. This sets up the
variable in the address space for kernel land to access and write to. The
macros above, AT, VLOAD and VVIRT deal with modifying addresses so that
the proper piece of data, at the vnotb, is referenced.

Now, you need to declare the value that the kernel land will write to. In
linux-2.6.37/arch/x86/include/asm/vsyscall.h declare this puppy and its
section that will be inserted via the above linker script entry you most
recently added:

```
#define __section_vnotb __attribute__ ((unused, 
 ↪__section__ (".vnotb"), aligned(16)))
```
In this file, as mentioned, you also will declare the kernel-land variable
to which the kernel will write. To keep things slightly more readable,
associate your variable next to the vgetcpu_mode declaration:

```
extern int vnotb;
```

You also will define a value the kernel can read (I don’t use this
in my example, but if the kernel needs to read the value, this is the
variable to read):


```
extern int __vnotb;
```

Now let’s put this stuff in code and give it a value. The kernel will
write the value via the writable vnotb, and you also can read it from
the shared memory between kernel and userland via __vnotb. You will
write the value in the kernel-land version of the variable, which is
writable. In linux-2.6.37/arch/x86/kernel/vsyscall_64.c, preferably after
all of the #include headers and just after the piece: int __vgetcpu_mode
__section_vgetcpu_mode;, add the following:

```C
int __vnotb __section_vnotb;
```

Remember, you did a trick with the linker setting the value. If you
set the value globally, as you would for an extern, you would not get
a value, the linker would override it. You need to set this value
at runtime and not statically at compile time. To set this value
as the kernel updates, modify the `update_vsyscall()` routine in
`linux-2.6.37/arch/x86/kernel/vsyscall_64.c` with:

```C
vnotb = 666;
```

This statement is defining the value declared previously in `vsyscall.h`.

## Compiling, Linking and Running

Wait, is that all there is to adding a vDSO? Um, yes. Of course,
if the function was something supported by the C library (glibc, in
our case), you can hack that to do the detection of vDSO and then the
actual call. However, I mentioned we wouldn’t be hacking glibc. And,
you don’t need to anyway, because getting the code to work is pretty
simple. With the chunks described above all in place, it’s time to start
building. Just configure and compile your kernel as you typically would:

```
make menuconfig
make bzImage
make modules
make modules_install
```

Now, install and boot your new modified vDSO kernel. Once that is up
and running, it’s time to test a few things, mainly the vDSO stuff
you just added. Let’s compile a test case to exercise the vDSO call:

```C
/* notb.c */
#include <stdio.h>

int main(void) {
    int notb = number_of_the_beast();
    printf("His number is %d\n", notb);
    return 0;
}
```

Then, compile the code above as:

```
gcc notb.c -o notb vdso.so
```

The file you link against is `vdso.so`, which provides the symbol
resolution needed to make the kernel call. The kernel version of
`number_of_the_beast()` is called, even if the code for that function
is completely different in `vdso.so`. Where is vdso.so located? It’s
located in the kernel build directory after building the kernel:
`linux-2.6.37/arch/x86/vdso/vdso.so`.

At runtime, when a program executes `number_of_the_beast`, the kernel code
is called and not the version of `number_of_the_beast()` in the `vdso.so`
file. If you modify the kernel and, say, have `number_of_the_beast()`
return 42, then unless you load that kernel, you still will get 666. Even
if you compile the test example above with the newer modified-to-42
`vdso.so`.

Another way of getting the `vdso.so` file is by writing a program that
extracts the vDSO memory from a running executable. Numerous sources
on-line explain how to do this, but I briefly describe it here. The
vDSO page, which is mapped into the memory of every running process,
can be in a non-deterministic memory range of your executing process,
thanks to Linux’s address space layout randomization (ASLR). To get
this address, a running program can find its memory information from
the file `/proc/self/maps`. In there, a line with the text `[vdso]`
exists. That line contains the address range in the executing process
of the vDSO page. For example, you could run `cat /proc/self/maps`.

Note that running this command multiple times produces different address
ranges for [vdso] thanks to (if your kernel supports it) address space
layout randomization.

The output should look something similar to:


```
...
7fff40d71000-7fff40d72000 r-xp 00000000 00:00 0 [vdso]
...
```

The above range is showing for the cat process you just executed that the
address range for the vDSO page is located starting at 7fff40d71000 and
ending at 7fff40d7200. Subtracting the start and end range, you get 0x1000
or 4096 bytes. 4096 is the page size often used in the kernel. Listing 1
shows code for extracting the vDSO from a running kernel, and it is based
on code from the "Examining the Linux VDSO" article listed in Resources.

A simple dumping of the dynamic object symbols can be conducted via:

```
objdump -T vdso.so
```

Because a shared library is also an elf, the readelf tool also can be used on vdso.so.

Listing 1. Extracting the vDSO from a Running Kernel

```C
/* extract_vdso.c */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>


int main(int argc, char **argv)
{
    char        buf[256], *mem;
    const char *range_name;
    FILE       *rd, *wr;
    long long   start_addr, end_addr;

    /* Open file for writing the vdso data to */
    if (argc != 3)
    {
        fprintf(stderr,
                "Usage: %s <file> <string>\n"
                "\t<file>:   File to write the vdso data to.\n"
                "\t<string>: Name of the mapped in region, e.g. vdso\n",
                argv[0]);

        abort();
    }

    range_name = argv[2];

    if (!(wr = fopen(argv[1], "w")))
    {
        perror("Error: fopen() - output file");
        abort();
    }

    /* Get this process' memory layout */
    if (!(rd = fopen("/proc/self/maps", "r")))
    {
        perror("Error: fopen() - /proc/self/maps");
        abort();
    }

    /* Find the line in /proc/self/maps that contains 
       the substring [vdso] * */
    while (fgets(buf, sizeof(buf), rd))
    {
        if (strstr(buf, range_name))
          break;
    }

    fclose(rd);

    /* Locate the end memory range for [vdso] */
    end_addr = strtoll((strchr(buf, '-') + 1), NULL, 16);

    /* Terminate the string so we can get the start 
       address really easily * */
    *(strchr(buf, '-')) = '\0';
    start_addr = strtoll(buf, NULL, 16);

    /* Open up the memory page and extract the vdso */
    if (!(rd = fopen("/proc/self/mem", "r")))
    {
        perror("Error: fopen() - /proc/self/mem");
        abort();
    }

    /* Hop to the vdso portion */
    fseek(rd, start_addr, SEEK_SET);

    /* Copy the memory locally and then move it to the file */
    mem = malloc(end_addr - start_addr);
    if (!fread(mem, 1, end_addr - start_addr, rd))
    {
        perror("Error: read() - /proc/self/mem");
        abort();
    }

    /* Write the data to the specified output file */
    if (!fwrite(mem, 1, end_addr - start_addr, wr))
    {
        perror("Error: fwrite() - output file");
        abort();
    }

    free(mem);
    fclose(rd);
    fclose(wr);

    printf("Start: %p\nEnd:   %p\nBytes: %d\n",
            (void *)start_addr, (void *)end_addr, (int)(end_addr -
             ↪start_addr));

    return 0;
}
```

## Security Implication

Anytime you dabble with the kernel, you should consider the security
implications. If you think you can "own" someone by creating your own vDSO
calls, you might want to think again. Because adding a vDSO requires users
to bake their own kernels, the only people they could be compromising
is their system and the users on their system. Of course, any dabbling
with kernel resources should be done with much consideration. Remember,
playing with vDSO goodies occurs in userland; however, your vDSOs can
access kernel data. And, your kernel can read vDSO data. That can be
a concern, but I will leave that up to you as an exercise for finding
anything exploitable.

Finally, this article is just a little one-two on how to cook up your
own vDSO. Now go make yourself a smoking kernel.

Resources

GNU/Linux Kernel. 2.6.37: http://www.kernel.org

"6.30 Declaring Attributes of Functions" (GCC Manual): http://gcc.gnu.org/onlinedocs/gcc/Function-Attributes.html

"Weak Symbol" (Wikipedia): http://en.wikipedia.org/wiki/Weak_symbol

"Examining the Linux VDSO" (Truth, Computing and Fail): http://anomit.com/2010/04/18/examining-the-linux-vdso

Johan Peterson’s "What is linux-gate.so.1?": http://www.trilithium.com/johan/2005/08/linux-gate

Matt Davis ["Linux syscall, vsyscall, and vDSO...Oh My!"]( http://davisdoesdownunder.blogspot.com/2011/02/linux-syscall-vsyscall-and-vdso-oh-my.html )
<!-- vim: set autoindent expandtab sw=4 syntax=markdown: -->
