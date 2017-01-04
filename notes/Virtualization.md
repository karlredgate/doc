
<!--
-->

Vagrant
-------

http://www.vagrantbox.es/
https://github.com/CommanderK5/packer-centos-template/releases

Xhyve
------

http://blog.dunkelstern.de/2016/01/16/xhyve-lightweight-vm-for-mac-os-x/
https://github.com/dunkelstern/xhyve
https://github.com/mist64/xhyve
https://gist.github.com/valentin-nasta/64d8156bffdc7f3ac1bc
http://tuxdiary.com/2015/06/11/xhyve/

 * [Run xhyve with network without sudo](https://github.com/mist64/xhyve/issues/60)
 * [xhyve – Lightweight Virtualization on OS X Based on bhyve](http://www.pagetable.com/?p=831)
 * [Using the OS X 10.10 Hypervisor Framework: A Simple DOS Emulator](http://www.pagetable.com/?p=764)
 * <http://tinycorelinux.net/>
 * <http://www.minibsd.org/>
 * <http://www.damnsmallbsd.org/>
 * <https://en.wikipedia.org/wiki/List_of_BSD_operating_systems>
 * <https://en.wikipedia.org/wiki/PicoBSD>
 * [nanobsd](https://www.freebsd.org/cgi/man.cgi?query=nanobsd&sektion=8&n=1)
 * [picobsd](https://people.freebsd.org/~picobsd/old/picobsd.html)

### Running Tiny Core Linux

xhyve already integrates Tiny Core Linux in its repository and it’s
very easy to test it out. Run:

```
$ git clone https://github.com/mist64/xhyve
$ cd xhyve
$ make
$ ./xhyverun.sh
```

https://deis.com/blog/2015/get-started-coreos-os-x

https://virt-manager.org/

Tiny Hypervisor
---------------

Tiny and transparent hypervisor Beta
https://sourceforge.net/p/mavmm/code/HEAD/tree/trunk/mavmm/

NOVA Microhypervisor
--------------------

Like third-generation microkernels, the NOVA microhypervisor uses
a capability-based authorization model and provides only basic
mechanisms for virtualization, spatial and temporal separation,
scheduling, communication, and management of platform resources.
The disaggregated multi-server environment implements additional
operating-system services in user mode, such as device drivers,
protocol stacks, and policies. On machines with hardware virtualization
features, NOVA can run multiple unmodified guest operating systems
concurrently. Each VM has its own associated virtual-machine monitor
(VMM) that runs as an unprivileged user application on top of the
microhypervisor.

What about OSv on NOVA??

http://hypervisor.org/
https://github.com/udosteinberg/NOVA

Get the PDF papers from the main site.

MirageOS
--------

MirageOS is a library operating system that constructs unikernels
for secure, high-performance network applications across a variety
of cloud computing and mobile platforms. Code can be developed on
a normal OS such as Linux or MacOS X, and then compiled into a
fully-standalone, specialised unikernel that runs under the Xen
hypervisor.

Written in OCaml

https://mirage.io/
https://github.com/mirage/mirage

Unikernels
----------

https://www.linux.com/news/are-cloud-operating-systems-next-big-thing

| Cloud OS      | Targeted language | Available for                     |
|---------------|-------------------|-----------------------------------|
| ClickOS       | C++               | Xen                               |
| Drawbridge    | C                 | Windows ”picoprocess"             |
| ErlangOnXen   | Erlang            | Xen                               |
| HalVM         | Haskell           | Xen                               |
| GUK11         | Java              | Xen                               |
| MiniOS        | C                 | Xen                               |
| MirageOS      | OCaml             | Xen, kFreeBSD, POSIX, WWW/js      |
| NetBSD “rump” | C                 | NetBSD, Xen, Linux kernel, POSIX  |
| OSv           | Java              | KVM, Xen                          |

 * http://www.xenproject.org/presentations-and-videos/video/latest/xpds13v-clickos.html
 * http://research.microsoft.com/en-us/projects/drawbridge/
 * http://erlangonxen.org/
 * http://corp.galois.com/halvm
 * https://kenai.com/projects/guestvm
 * http://wiki.xenproject.org/wiki/Mini-OS-DevNotes
 * http://www.xenproject.org/developers/teams/mirage-os.html
 * http://www.netbsd.org/docs/rump/
 * https://github.com/cloudius-systems/osv

https://medium.com/google-cloud/unikernel-on-google-compute-engine-part-1-running-an-osv-unikernel-tomcat-server-45bd9816910#.7q331q40y
https://www.penninkhof.com/2015/08/mosquitto-unikernel-using-osv-and-capstan/


### OSv

https://en.wikipedia.org/wiki/OSv
http://osv.io/

### Capstan

Capstan, a tool for packaging and running your application on OSv.

 * http://osv.io/capstan/
 * https://github.com/cloudius-systems/capstan

<!-- vim: set autoindent expandtab sw=4 syntax=markdown: -->
