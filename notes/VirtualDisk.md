Virtual Disk Formats
====================

What are our options for managing virtual disks?

Can they be married with the tape formats?

How to get access to files in the disk image?

libguestfs

Formats
-------

 * VHD
 * VMDK
 * QCOW2
 * VHDx
 * pVHD


VHD
----

Does offer dedup.

How to enable dedup for Hyper-V?
 [Top five deatures - dedup](http://searchservervirtualization.techtarget.com/photostory/2240148767/Top-five-Hyper-V-30-features-that-will-excite-IT-pros/2/Five-best-Hyper-V-30-features-Deduplication )

How are snapshots managed?

Pages for defragmenting VHDs:

 * [PowerShell Optimize-VHD](http://technet.microsoft.com/en-us/library/hh848458.aspx )
 * [Compacting a Dynamically Expanding virtual hard disk in Windows Server 2012](http://blogs.technet.com/b/askcore/archive/2012/09/20/compacting-a-dynamically-expanding-virtual-hard-disk-in-windows-server-2012.aspx )
 * [Use PowerShell 3.0 to Optimize Hyper-V VHD Size](http://blogs.technet.com/b/heyscriptingguy/archive/2012/10/17/use-powershell-3-0-to-optimize-hyper-v-vhd-size.aspx )
 * [What is New in Data Deduplication in Windows Server 2012 R2](http://technet.microsoft.com/en-us/library/dn486808.aspx )
 * [Defrag a virtual hard disk (.vhd)?](http://stackoverflow.com/questions/281527/defrag-a-virtual-hard-disk-vhd )

The defrag page just list has a link to a sysinternals tool for doing the defrag at
[CONTIG](http://technet.microsoft.com/en-us/sysinternals/bb897428.aspx )
which I downloaded and cache in this dir.

