
<!--
-->

Install is a pain in the ass

https://www.freebsdnews.com/2009/06/15/install-freebsd-80-usb-memory-stick/
http://www.freebsd.org/doc/handbook/usb-disks.html

mounting cd just generated an invalid argument error.
Had to do this:

```
mount_cd9660 /dev/cd0 /mnt
```

http://www.cabstand.com/usbflash.html
http://ezinearticles.com/?How-To-Quickly-Make-A-Bootable-USB-Stick-With-FreeBSD&id=5450234
http://mfsbsd.vx.sk/
http://people.freebsd.org/~mm/mfsbsd/mfsbsd.pdf

Install hangs on uart probe

 * [Installation hangs on uart1]( https://forums.freebsd.org/threads/43882/ )
 * http://freebsd.1045724.n5.nabble.com/Fixing-suspend-resume-on-Lenovo-x220-td5819783.html
 * [Freenas 8.0 Release not booting on USB stick after install on Dell Server]( https://bugs.freenas.org/issues/321 )


<!-- vim: set autoindent expandtab sw=4 syntax=markdown: -->
