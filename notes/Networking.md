
<!--
-->

https://en.wikipedia.org/wiki/Network

This one is the one to read:

https://en.wikipedia.org/wiki/Network_theory


Network Testing
---------------

Mininet provides network testing using Linux containerization
for network namespaces.

https://github.com/mininet/mininet

[Introduction to Mininet]( https://www.youtube.com/watch?v=jmlgXaocwiE )

Mininet is just cgroups for the network interfaces.

Userspace Bridge
----------------

 * Capture physical interface using `packet(7)` socket in `RAW` mode.
 * Create TAP interface in a specific netns maybe.
 * use packet mmap for packet access

Is there a similar mechanism to mmap in FreeBSD?

Load Balancer
-------------

Use the mmap network interface mechanism to capture interfaces
and break HTTP like C14 and apply load balancing rules.

 * uIP TCP stack - like TTE?
 * stream chunks of messages
 * something that does the basic parsing into start of header, etc
 * replicate the messaging
 * policy that transforms

Could this just be layered on the bridge?

OpenVPN
-------

### UI for OpenVPN on OSX

tunnelblick
https://www.tunnelblick.net/
https://www.tunnelblick.net/documents.html

Switches
--------

### Infinetics

Infinetics was where Reed worked - funcky switch arch.

http://infinetics.com/technology/
http://www.google.com/patents/US20130083701

Raw Sockets
-----------

Some notes on raw sockets
[here]( http://sock-raw.org/papers/sock_raw )

And Packet sockets

https://www.kernel.org/doc/Documentation/networking/packet_mmap.txt
http://pub.netsniff-ng.org/paper/devconf_2013.pdf
http://yusufonlinux.blogspot.com/2010/11/data-link-access-and-zero-copy.html


OSX has `PF_NDRV` sockets for raw packets from a device.
Some
[notes here]( https://lists.apple.com/archives/darwin-development/2002/Mar/msg00270.html )
and notes for *golang*
[here]( http://stackoverflow.com/questions/32575558/creating-raw-packets-with-go-1-5-on-macosx ).

MacVTap
-------

This is *NOT* OSX - it is a linux driver.

http://virt.kernelnewbies.org/MacVTap

### Purpose

Macvtap is a new device driver meant to simplify virtualized bridged
networking. It replaces the combination of the tun/tap and bridge drivers
with a single module based on the macvlan device driver. A macvtap
endpoint is a character device that largely follows the tun/tap ioctl
interface and can be used directly by kvm/qemu and other hypervisors
that support the tun/tap interface. The endpoint extends an existing
network interface, the lower device, and has its own mac address on the
same ethernet segment. Typically, this is used to make both the guest
and the host show up directly on the switch that the host is connected to.


### VEPA, Bridge and private mode

Like macvlan, any macvtap device can be in one of three modes, defining
the communication between macvtap endpoints on a single lower device:

Virtual Ethernet Port Aggregator (VEPA), the default mode: data from one
endpoint to another endpoint on the same lower device gets sent down the
lower device to external switch. If that switch supports the hairpin
mode, the frames get sent back to the lower device and from there to
the destination endpoint.

Most switches today do not support hairpin mode, so the two endpoints
are not able to exchange ethernet frames, although they might still
be able to communicate using an tcp/ip router. A linux host used
as the adjacent bridge can be put into hairpin mode by writing to
`/sys/class/net/dev/brif/port/hairpin_mode`.  This mode is particularly
interesting if you want to manage the virtual machine networking at
the switch level. A switch that is aware of the VEPA guests can enforce
filtering and bandwidth limits per MAC address without the Linux host
knowing about it.


Bridge, connecting all endpoints directly to each other. Two endpoints
that are both in bridge mode can exchange frames directly, without the
round trip through the external bridge. This is the most useful mode
for setups with classic switches, and when inter-guest communication is
performance critical.

For completeness, a private mode exists that behaves like a VEPA mode
endpoint in the absence of a hairpin aware switch. Even when the switch
is in hairpin mode, a private endpoint can never communicate to any
other endpoint on the same lowerdev.

### Setting up macvtap

A macvtap interface is created an configured using the ip link command
from iproute2, in the same way as we configure macvlan or veth interfaces.

Example:

```
$ ip link add link eth1 name macvtap0 type macvtap
$ ip link set macvtap0 address 1a:46:0b:ca:bc:7b up
$ ip link show macvtap0
12: macvtap0@eth1: <BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state UNKNOWN
    link/ether 1a:46:0b:ca:bc:7b brd ff:ff:ff:ff:ff:ff
```

At the same time a character device gets created by udev. Unless
configured otherwise, udev names this device /dev/tapn, with n
corresponding to the number of network interface index of the new macvtap
endpoint, in the above example '12'. Unlike tun/tap, the character device
only represents a single network interface, and we can give the ownership
to a user or group that we want to be able to use the new tap. Configuring
the mac address of the endpoint is important, because this address is
used on the external network, the guest is not able to spoof or change
that address and has to be configured with the same address.

### Qemu on macvtap

Qemu as of 0.12 does not have direct support for macvtap, so we have to
(ab)use the tun/tap configuration interface. To start a guest on the
interface from the above example, we need to pass the device node as
an open file descriptor to qemu and tell it about the mac address. The
scripts normally used for bridge configuration must be disabled. A bash
redirect can be used to open the character device in read/write mode
and pass it as file descriptor 3.

```
qemu -net nic,model=virtio,addr=1a:46:0b:ca:bc:7b -net tap,fd=3 3<>/dev/tap11
```

A Recursive Network Architecture
--------------------------------

??

<http://www.isi.edu/rna/>

Is this the same?
<https://en.wikipedia.org/wiki/Recursive_InterNetwork_Architecture_(RINA)>

BEEP
-----

What is the similarity between BEEP and HTTP/2

QUIC
----

Same as ?
https://en.wikipedia.org/wiki/QUIC

<!-- vim: set autoindent expandtab sw=4 syntax=markdown: -->
