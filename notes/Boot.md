Boot environ and xxxPE
======================

 * google: biosboot partition

The
[BIOS boot partition]( http://en.wikipedia.org/wiki/BIOS_boot_partition )
is a partition on a data storage device that GNU GRUB uses on legacy
BIOS-based personal computers in order to boot an operating system,
when the actual boot device contains a GUID Partition Table (GPT).
Such a layout is sometimes referred to as BIOS/GPT boot.

A BIOS boot partition is needed because GPT uses the disk sectors
immediately following the Master Boot Record (MBR) to hold the
actual partition table, whereas the traditional MBR-based partitioning
scheme does not designate them for any special purpose.
As a result, there is not enough unused space available for storing
second stages of boot loaders on GPT disks; boot loaders are usually
implemented so their code stored within the MBR, which cannot hold
more than 512 bytes, operates as a first stage that serves primarily
to load a more sophisticated second stage, which is, for example,
capable of reading and loading an operating system kernel from a
file system.

 * []( http://www.funtoo.org/GUID_Booting_Guide )
 * []( http://en.wikipedia.org/wiki/GUID_Partition_Table )
 * []( http://en.wikipedia.org/wiki/Host_protected_area#BEER )
 * []( http://en.wikipedia.org/wiki/EFI_System_partition )
 * []( http://en.wikipedia.org/wiki/Windows_Preinstallation_Environment#Windows_Recovery_Environment )
 * []( http://en.wikipedia.org/wiki/BartPE )

[TeutonPE]( http://teutonpe.de/ )
(Preinstalled Environment) can be seen as a "total conversion" of
BartPE. Goal is a Boot CD / Usb (Thumb-)drive etc. which contains
Portable Applications that can be run from the CD/USB in your
(Windows or Wine-dows or ReactOS).
If this isnt possible the Applications can be run from an "own" OS.
Furthermore you can run and use it in a Virtual machine (Qemu /
VirtualBox / VirtualPC).

[Windows To Go]( http://en.wikipedia.org/wiki/Windows_To_Go )
is a feature in Windows 8 Enterprise that allows Windows 8 Enterprise
to boot and run from mass storage devices such as USB flash drives
and external hard disk drives.
It is a fully manageable corporate Windows 8 environment.

It is intended to allow enterprise administrators to provide users
with an imaged version of Windows 8 that reflects the corporate
desktop. Creation of Windows To Go drives is not officially supported
by other Windows 8 editions.

<!-- vim: set autoindent expandtab sw=4 syntax=markdown: -->
