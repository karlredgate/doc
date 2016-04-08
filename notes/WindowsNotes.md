
<!--
-->

 * search: windows change administrator password from command line
 * ( http://allusefulinfo.com/how-to-change-administrator-password-in-windows-7-using-cmd/ )

### WSMan WinRM

 * ( https://openwsman.github.io/ )
 * search: winrm
 * search: winrm vs wsman
 * ( https://en.wikipedia.org/wiki/WS-Management )
 * ( https://forge.soa4d.org/ )

 * ( https://en.wikipedia.org/wiki/Microsoft_Windows_library_files )
 *
 * ( https://en.wikipedia.org/wiki/HAL_%28software%29 )
 * ( https://en.wikipedia.org/wiki/Hardware_abstraction )
 * ( https://en.wikipedia.org/wiki/Ntoskrnl.exe )
 * ( https://en.wikipedia.org/wiki/Microsoft_Windows_library_files#Hal.dll )
 * ( https://en.wikipedia.org/wiki/Client/Server_Runtime_Subsystem )
 * ( http://web.archive.org/web/20100912231625/http://technet.microsoft.com/en-us/sysinternals/bb897447.aspx )
 * ( https://en.wikipedia.org/wiki/Architecture_of_Windows_NT )
 * ( https://en.wikipedia.org/wiki/Windows_NT_startup_process )
 * ( https://en.wikipedia.org/wiki/Windows_service )
 * ( https://technet.microsoft.com/en-us/library/cc750820.aspx#XSLTsection124121120120 )
 * ( https://technet.microsoft.com/en-us/magazine/2007.03.vistakernel.aspx )
 * ( https://en.wikipedia.org/wiki/MinWin )
 * ( https://en.wikipedia.org/wiki/Windows_Vista_startup_process )

 * ( https://en.wikipedia.org/wiki/System_partition_and_boot_partition )
 * ( https://en.wikipedia.org/wiki/BIOS_boot_partition )
 * ( https://en.wikipedia.org/wiki/EFI_System_partition )
 * ( https://en.wikipedia.org/wiki/Windows_To_Go )
 * ( http://homepage.ntlworld.com./jonathan.deboynepollard/FGA/windows-nt-6-boot-process.html )
 * ( http://homepage.ntlworld.com./jonathan.deboynepollard/FGA/efi-boot-process.html )
 * ( http://www.uefi.org/sites/default/files/resources/2014_UEFI_Plugfest_04_Intel.pdf )
 * ( https://github.com/01org/luv-yocto )
 * ( https://01.org/linux-uefi-validation )
 * ( https://github.com/chipsec/chipsec )

Windows Clones
--------------

https://en.wikipedia.org/wiki/ReactOS

Shell Extension
---------------

github windows shell extension

https://github.com/dwmkerr/sharpshell
https://github.com/google/google-drive-shell-extension
https://github.com/vbaderks/msf

Shell Folders
-------------

[User Shell Folders]( https://technet.microsoft.com/en-us/library/cc962613.aspx )

Keys

```
HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer
```

The User Shell Folders subkey stores the paths to Windows Explorer
folders for the current user of the computer.

The entries in this subkey can appear in both the Shell Folders
subkey and the User Shell Folders and in both `HKEY_LOCAL_MACHINE`
and `HKEY_CURRENT_USER`. The entries that appear in user User Shell
Folders take precedence over those in Shell Folders. The entries
that appear in `HKEY_CURRENT_USER` take precedence over those in
`HKEY_LOCAL_MACHINE`.

Related Entries

 * Shell Folders in `HKEY_CURRENT_USER`
 * Shell Folders in `HKLM`
 * User Shell Folders in `HKLM`

https://en.wikipedia.org/wiki/Special_folder
https://en.wikipedia.org/wiki/File_URI_scheme

Shell Library
-------------

SHLWAPI

[UrlCreateFromPath]( https://msdn.microsoft.com/en-us/library/windows/desktop/bb773773(v=vs.85).aspx )
[Shell Path Handling Functions]( https://msdn.microsoft.com/en-us/library/windows/desktop/bb773559(v=vs.85).aspx )
[Common HRESULT Values]( https://msdn.microsoft.com/en-us/library/windows/desktop/aa378137(v=vs.85).aspx )


Microsoft Backup Structure
--------------------------

[MS-BKUP: Microsoft NT Backup File Structure]( https://msdn.microsoft.com/en-us/library/dd305136.aspx )

Authenticode
------------

[Windows Authenticode Portable Executable Signature Format]( https://msdn.microsoft.com/en-us/windows/hardware/gg463180.aspx )
[How To Get Information from Authenticode Signed Executables]( https://support.microsoft.com/en-us/kb/323809 )
http://stackoverflow.com/questions/301024/validate-authenticode-signature-on-exe-c-without-capicom

MinGW
-----

Things that build for Visual C do not work for GNU.

### Wide strings

Microsoft C compilers will handle `L##x` in macros and translate it
to a long string like `L"test"` - gcc probably will for some, but a
common paradigm in Visual C code is to use `__FUNCTION__` and related
in debug strings using macros that attempt to make them *wide* strings.
This is seen with macros like this:

```
#define GEN_EVAL(X) X
#define GEN_STRINGIZE_ARG(X) #X
#define GEN_STRINGIZE(X) GEN_EVAL(GEN_STRINGIZE_ARG(X))
#define GEN_MERGE(A, B) A##B
#define GEN_MAKE_W(A) GEN_MERGE(L, A)
#define GEN_WSTRINGIZE(X) GEN_MAKE_W(GEN_STRINGIZE_ARG(X))
#define __WFILE__ GEN_MAKE_W(GEN_EVAL(__FILE__))
#define __WFUNCTION__ GEN_MAKE_W(GEN_EVAL(__FUNCTION__))
```

In gcc `__FUNCTION__`, and related identifiers, are **NOT** macros
that produce string literals.  They are variables - and so they cannot
be used in macros with a prefixed `L` and cannot be used to initialize
arrays.
[*reference*]( https://gcc.gnu.org/onlinedocs/gcc/Function-Names.html )

This will be seen in error messages like:

```
identifier "L__FUNCTION__" is undefined.
```

This is partially due to a recommendation to generate long string
identifiers for MS code.

Example from
[this stackoverflow page]( http://stackoverflow.com/questions/4773941/wide-version-of-function-on-linux ):

```
#define WIDE2(x) L##x
#define WIDECHAR(x) WIDE2(x)
#define WIDE_FUNCTION WIDECHAR(__FUNCTION__)

int main( int args, char **argv ) {
    wchar_t *foo = L"This is a test";
    const char *f = __FUNCTION__;
    wchar_t *wf = WIDE_FUNCTION;
}
```

Another example from
[this stackoverflow page]( http://stackoverflow.com/questions/3291047/how-do-i-print-the-string-which-file-expands-to-correctly/3291315#3291315 )

```
#define WIDEN2(x) L ## x
#define WIDEN(x) WIDEN2(x)
#define WFILE WIDEN(__FILE__)

int main() {
    wprintf("%s\n", WFILE);
    return 0;
}
```

### XML Library

The older MinGW did not have `msxml.h` and the associated
DLL at least on OSX.  It is not clear if it was just old or it
was just that it is only present in the 64 bit environment.
Update to the latest using brew to get the current 64 bit
version that has the library.

https://sourceforge.net/p/mingw-w64/mailman/message/34335349/
https://sourceforge.net/p/mingw-w64/mingw-w64/ci/23ef19a4cc067b1871351c272f773267e9852e64/

### ATL

Windows provides a proprietary library for Objects called ATL.

[CTime]( https://msdn.microsoft.com/en-us/library/b6989cds.aspx )

https://en.wikipedia.org/wiki/Active_Template_Library

Read this page - this is used heavily in ATL

https://en.wikipedia.org/wiki/Curiously_recurring_template_pattern

Data Types
----------

[ULARGE_INTEGER union]( https://msdn.microsoft.com/en-us/library/windows/desktop/aa383742(v=vs.85).aspx )

[Windows Data Types]( https://msdn.microsoft.com/en-us/library/windows/desktop/aa383751(v=vs.85).aspx )

Windows APIs
------------

https://en.wikipedia.org/wiki/Windows.h
[Define GUID]( http://forum.pellesc.de/index.php?topic=2670.0 )
http://www.naughter.com/download/FIX_AFXASSUME.h
http://stackoverflow.com/questions/386220/how-can-i-hide-defined-but-not-used-warnings-in-gcc
http://stackoverflow.com/questions/577270/creating-new-exception-in-c#577338


It appears that the `ULONG` and related types are defined in `windef.h`
ndows Data Types]( https://msdn.microsoft.com/en-us/library/windows/desktop/aa383751(v=vs.85).aspx )

One of the problems showed as an issue with `auto_ptr`
[documented here]( https://en.wikipedia.org/wiki/Auto_ptr ).
This really was a problem with the base type - and I just needed an include.

String conversions appeared to be a problem - but it really was just
the rebit folks not using the correct interfaces

```
ADD EXAMPLE OF THE CODE CHANGE
```

http://stackoverflow.com/questions/347949/how-to-convert-a-stdstring-to-const-char-or-char

This was related to calls to the `MoveFileEx()` function.  This appeared
to be due to the MS compilers defaulting to the W version.  For MinGW
I needed to be explicit - since the arguments were wide.

[MoveFileEx function]( https://msdn.microsoft.com/en-us/library/windows/desktop/aa365240(v=vs.85).aspx )

"std::wstring" to "wchar_t"
http://stackoverflow.com/questions/246806/i-want-to-convert-stdstring-into-a-const-wchar-t

[SetupDiGetClassDevs function]( https://msdn.microsoft.com/en-us/library/windows/hardware/ff551069(v=vs.85).aspx )
[GetDiskFreeSpaceEx function]( https://msdn.microsoft.com/en-us/library/windows/desktop/aa364937(v=vs.85).aspx )
[FindFirstVolume function]( https://msdn.microsoft.com/en-us/library/windows/desktop/aa364425(v=vs.85).aspx )
[GetFileAttributes function]( https://msdn.microsoft.com/en-us/library/windows/desktop/aa364944(v=vs.85).aspx )
CheckVolumePaths

http://mingw.5.n7.nabble.com/gcc-Microsoft-variable-collision-td24648.html


AFX / ATL
---------

Application Framework eXtensions are part of the
[Microsoft Foundation Class Library]( https://en.wikipedia.org/wiki/Microsoft_Foundation_Class_Library )

 * https://en.wikipedia.org/wiki/Active_Template_Library
 * https://en.wikipedia.org/wiki/List_of_C%2B%2B_template_libraries

 * [CObArray::RemoveAt]( https://msdn.microsoft.com/en-us/library/aa271241(v=vs.60).aspx )
 * [CObArray]( https://msdn.microsoft.com/en-us/library/aa271257(v=vs.60).aspx )
 * [CObject Class Members]( https://msdn.microsoft.com/en-us/library/aa271299(v=vs.60).aspx )
 * [CStringArray Class Members]( https://msdn.microsoft.com/en-us/library/aa315032(v=vs.60).aspx )

### FormatString

 * [AfxFormatString1]( https://msdn.microsoft.com/en-us/library/19d0ss8w.aspx )
 * [AfxFormatString2]( https://msdn.microsoft.com/en-us/library/f1w5d2h2.aspx )
 * [AfxMessageBox]( https://msdn.microsoft.com/en-us/library/as6se7cb.aspx )

### Tracing

 * https://en.wikipedia.org/wiki/Windows_software_trace_preprocessor
 * [Event Tracing Functions]( https://msdn.microsoft.com/en-us/library/windows/desktop/aa363795(v=vs.85).aspx )

 * [TRACE]( https://msdn.microsoft.com/en-us/library/6w95a4ha.aspx )
 * [AFX Messages]( https://msdn.microsoft.com/en-us/library/bb982948.aspx )

### SEH - Structured Event Handling

This is an extension to the Microsoft (and Digital Mars) compilers.
It adds the `__try`, `__except`, `__finally`, and `__leave` keywords.
These have been implemented as libraries for GCC compilers.
The libraries are all for `i686` only, not `x86_64`

 * [try-finally Statement]( https://msdn.microsoft.com/en-us/library/9xtt5hxz.aspx )
 * http://www.experts-exchange.com/questions/21793519/Porting-leave-What-does-leave-do-anyway.html
 * [seh.cc]( https://gist.github.com/kikairoya/1710310 )
 * http://www.open-std.org/jtc1/sc22/wg14/www/docs/n1298.pdf
 * [libSEH]( http://www.programmingunlimited.net/siteexec/content.cgi?page=libseh )

Function argument decorators
----------------------------

`__in` and `__out` and `IN` and `OUT`

http://mingw.5.n7.nabble.com/gcc-Microsoft-variable-collision-td24648.html

`__out` is part of the documented SpecStrings API for self-documenting 
functions in the Standardized Annotation Language.  It is used in the 
last version of the PSDK and the WinSDK in various places.  Older PSDK 
headers do not have this interface.  The primary purpose is to enable 
bug-finding analysis, such as in the latest versions of MSVC.  See 
<http://msdn2.microsoft.com/en-us/library/aa383701(VS.85).aspx> for more 
information. 

It's vaguely similar to OUT, the macro that is extensively used in the 
SDKs' headers.  The difference is that OUT doesn't actually do anything; 
it substitutes to nothing.  `__out`, on the other hand, triggers various 
MSVC declspecs that presumably generate some sort of annotations. 

Using Poco
----------

I keep getting this error:

```
redeclared without dllimport attribute after being referenced with dll linkage
```

Referenced
[here]( http://stackoverflow.com/questions/11546403/importing-inline-functions-in-mingw#11550679 )
on StackOverflow.
Perhaps there is a problem in the Poco definitions?

### DLL in MinGW

Very simple example

```
#include <windows.h>
#include <objbase.h>

BOOL WINAPI
DllMain( HINSTANCE instance, DWORD fdwReason, LPVOID lpvReserved ) {
    switch ( fdwReason ) {
        case DLL_PROCESS_ATTACH:
            DisableThreadLibraryCalls( instance );
    }

    return 1;
}
```

Compile it using

```
x86_64-w64-mingw32-gcc -Wall -shared test.c -o test.dll
```


COM in MinGW
------------

http://disphelper.sourceforge.net/
https://sourceforge.net/projects/disphelper/?source=typ_redirect
http://www.codeproject.com/KB/COM/com_in_c1/com_in_c1_src.zip
http://www.codeproject.com/Articles/13601/COM-in-plain-C?display=Print
http://stackoverflow.com/questions/84269/using-component-object-model-com-on-non-microsoft-platforms

More info on COM, DCOM, OLE, etc.
Read the Wikipedia pages and their links.

https://en.wikipedia.org/wiki/Distributed_Component_Object_Model
https://en.wikipedia.org/wiki/Component_Object_Model
https://en.wikipedia.org/wiki/Object_Linking_and_Embedding

There is a DCOM server for Linux called Tangram - you grabbed the Source
and put it on the 1TB Passport drive in `WindowsTools/COM`

Calling Conventions
-------------------

`__stdcall` is the calling convention used for the function.  This tells
the compiler the rules that apply for setting up the stack, pushing
arguments and getting a return value.

There are a number of other calling conventions, `__cdecl`, `__thiscall`,
`__fastcall` and the wonderfully named `__naked`. `__stdcall` is the
standard calling convention for Win32 system calls.

 * http://stackoverflow.com/questions/297654/what-is-stdcall
 * https://en.wikipedia.org/wiki/X86_calling_conventions
 * http://stackoverflow.com/questions/696306/run-time-check-failure-0-loading-queryfullprocessimagename-from-kernel32-dll
 * [Argument Passing and Naming Conventions]( https://msdn.microsoft.com/en-us/library/984x0h58.aspx )

| Keyword      |Stack cleanup|Parameter passing |
|`__cdecl`     |Caller       |Pushes parameters on the stack, in reverse order (right to left) |
|`__clrcall`   |n/a          |Load parameters onto CLR expression stack in order (left to right) |
|`__stdcall`   |Callee       |Pushes parameters on the stack, in reverse order (right to left) |
|`__fastcall`  |Callee       |Stored in registers, then pushed on stack |
|`__thiscall`  |Callee       |Pushed on stack; this pointer stored in ECX |
|`__vectorcall`|Callee       |Stored in registers, then pushed on stack in reverse order (right to left)|


### Naked

[Naked Function Calls]( https://msdn.microsoft.com/en-us/library/5ekezyy2.aspx )

Functions declared with the naked attribute are emitted without prolog or
epilog code, enabling you to write your own custom prolog/epilog sequences
using the inline assembler. Naked functions are provided as an advanced
feature. They enable you to declare a function that is being called from
a context other than C/C++, and thus make different assumptions about
where parameters are, or which registers are preserved. Examples include
routines such as interrupt handlers. This feature is particularly useful
for writers of virtual device drivers (VxDs).

[Considerations for Writing Prolog/Epilog Code]( https://msdn.microsoft.com/en-us/library/6xy06s51.aspx )

Windows versions for Builds
---------------------------

[Modifying WINVER and _WIN32_WINNT]( https://msdn.microsoft.com/en-us/library/6sehtctf.aspx )

```
//
// _WIN32_WINNT version constants
//
#define _WIN32_WINNT_NT4                    0x0400 // Windows NT 4.0
#define _WIN32_WINNT_WIN2K                  0x0500 // Windows 2000
#define _WIN32_WINNT_WINXP                  0x0501 // Windows XP
#define _WIN32_WINNT_WS03                   0x0502 // Windows Server 2003
#define _WIN32_WINNT_WIN6                   0x0600 // Windows Vista
#define _WIN32_WINNT_VISTA                  0x0600 // Windows Vista
#define _WIN32_WINNT_WS08                   0x0600 // Windows Server 2008
#define _WIN32_WINNT_LONGHORN               0x0600 // Windows Vista
#define _WIN32_WINNT_WIN7                   0x0601 // Windows 7
#define _WIN32_WINNT_WIN8                   0x0602 // Windows 8
#define _WIN32_WINNT_WINBLUE                0x0603 // Windows 8.1
#define _WIN32_WINNT_WINTHRESHOLD           0x0A00 // Windows 10
#define _WIN32_WINNT_WIN10                  0x0A00 // Windows 10
```

Memory Management
-----------------

Looking at my own allocator - talked to Scot - who
pointed me at this:

[VirtualAlloc function]( https://msdn.microsoft.com/en-us/library/windows/desktop/aa366887%28v=vs.85%29.aspx )

Licencing
---------

http://www.theregister.co.uk/2001/07/12/can_winxp_product_activation/
http://www.theregister.co.uk/2001/07/10/winxp_product_activation_decoded/

Get the papers from this site

http://www.licenturion.com/xp/

Rootkits
--------

https://en.wikipedia.org/wiki/AFX_Windows_Rootkit_2003

<!-- vim: set autoindent expandtab sw=4 syntax=markdown: -->
