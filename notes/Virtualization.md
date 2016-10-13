
<!--
-->

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

<!-- vim: set autoindent expandtab sw=4 syntax=markdown: -->
