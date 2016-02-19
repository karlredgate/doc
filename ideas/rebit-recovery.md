How to Integrate Rebit
======================

The biggest limitation is the lack of *P2P*/driver injection.
The second limitation is no ReFS support.

It would be nice if they had a VHD export tool also.
We can generate a VHD tool by using `ntfsclone` and `ntfsclone2vhd`.

Driver Injection
----------------

Brian's idea was to have the recovery process set a bit in the
recovery process, such that at first boot additional recovery software
would run that would load drivers.

Their idea was to provide their own driver repository and update it
from vendor sites.

> * Where do vendors stores their drivers, and where would we need to look?
> * Do We need to handle more that network and storage?

I think we should try to leverage the Windows Update Services first.

 * WUSP - Windows Update Service Protocol
 * WSUS - Windows Server Update Service
 * BITS - 

> Need to draw how these connect.

ReFS Recovery
-------------

> Journal or block changes??

Track journal and store just the files that have changed.
Brian says that the journal works for ReFS also, and 
that we can treat this as just files recovery.
Since Linux does not support ReFS, have the recovery process
recover the boot disk and set additional info to allow first boot
to recover the ReFS partitions while running under Windows.

<!-- vim: set autoindent expandtab sw=4 syntax=markdown: -->
