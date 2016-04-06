
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


<!-- vim: set autoindent expandtab sw=4 syntax=markdown: -->
