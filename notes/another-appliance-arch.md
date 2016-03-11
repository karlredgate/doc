
## What is necessary

 * external API
   * use node
   * RDF for data like conductor
   * tools for pushing to cloud easily
 * How to purchase
 * how to get keys for a cloud
   * store keys in /etc/sysconfig
 * Use fedora as base?
 * Roll your own distro?
   * want upstart on systemd
 * Web UI
   * Angular?
   * What is that other one - knockout?
 * Portal in AWS ?
   * how to provide remote access to appliances
   * remote control using XSLT to apply to resource?
   * store as XSLT in reource dir that is downloaded
   * can the xslts use ideas from Google Wave?
   * Multi appliance portal - resellers or big customers
 * Diagnostics
 * Dialin
 * Ability to spin up as cloud instance or on local hardware

## What about VM failover on the appliance

 * would not work in cloud?
 * or use QEMU in cloud?


FreeBSD idea
------------

FreeBSD with ZFS and providing iSCSI export for block devices
backed by a zvol.

https://www.freebsd.org/doc/en_US.ISO8859-1/books/handbook/network-iscsi.html

<!-- vim: set autoindent expandtab sw=4 syntax=markdown: -->
