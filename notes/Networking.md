
<!--
-->

https://en.wikipedia.org/wiki/Network

This one is the one to read:

https://en.wikipedia.org/wiki/Network_theory


Network Testing
---------------

Mininet provides network testing using Linux containerization
for network namespaces.

http://mininet.org/
https://github.com/mininet/mininet

[Introduction to Mininet]( https://www.youtube.com/watch?v=jmlgXaocwiE )

Mininet is just cgroups for the network interfaces.

There are now many videos - listed here:

https://github.com/mininet/mininet/wiki/Videos

WiFi version: https://github.com/intrig-unicamp/mininet-wifi


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

NetFlow
-------

Flow monitoring - also sFlow and IPFIX

https://en.wikipedia.org/wiki/NetFlow

Traffic Grapher for Routers (maybe for Routed)
----------------------------------------------

This one is for visualizing NetFlow data.
http://wvnetflow.sourceforge.net/

https://en.wikipedia.org/wiki/Multi_Router_Traffic_Grapher

Paessler Router Traffic Grapher, renamed PRTG Network Monitor from
version 7 in 2008, is a server up-time and utilisation, network
monitoring and bandwidth usage software package for server
infrastructure from Paessler AG. It can monitor and classify bandwidth
usage in a network using SNMP, packet sniffing and Netflow. It
services Microsoft Windows and Linux. It was derived from the
open-source Multi Router Traffic Grapher (MRTG) project. A version
with a limited number of sensors is available free of charge.

https://en.wikipedia.org/wiki/Paessler_Router_Traffic_Grapher

PCAP
----

### CloudShark

CloudShark is a first of it’s kind web application that lets you
organize, analyze, and collaborate on network packet captures.

CloudShark lets you secure and track valuable network capture assets.
With tagging and search capabilities, all of your capture data is
in one place that lets you find what you need when you need it.

In addition, the CloudShark API lets you easily integrate into your
existing capture tools, letting you upload captures from anywhere,
or by using the CloudShark Plug-in for Wireshark.

CloudShark enhances the packet analysis process with web technology.
With a comfortable, clean interface, it lets you perform common
decode and analysis functions, embed and auto-lookup Wireshark
filters, and perform faster, better looking, and more direct analysis
of captures using tools like RTP playback, graphs, and controlled
decryption.

https://www.cloudshark.org/
https://ask.wireshark.org/questions/698/wwwcloudsharkorg
https://support.cloudshark.org/quick-start/installation-instructions.html


NOT open source - but they have some tools here:

https://github.com/cloudshark

Scrubbing
---------

Certain products use PCAP tools to find network signatures

Hacking Tunnels
----------------

### Tunneling IP over ICMP

Good links at the bottom of this:
https://en.wikipedia.org/wiki/ICMP_tunnel

http://sourceforge.net/projects/itun
http://code.gerade.org/hans/
http://icmpshell.sourceforge.net/
http://phrack.org/issues.html?issue=49&id=6#article

http://thomer.com/icmptx/

### Tunneling IP over DNS

http://thomer.com/howtos/nstx.html

### Broker

https://en.wikipedia.org/wiki/Tunnel_broker

Pseudo-wire
------------

https://en.wikipedia.org/wiki/Pseudo-wire

Virtual LANs
------------

### VXLAN

https://en.wikipedia.org/wiki/Virtual_Extensible_LAN

Virtual Extensible LAN (VXLAN) is a network virtualization technology
that attempts to improve the scalability problems associated with
large cloud computing deployments. It uses a VLAN-like encapsulation
technique to encapsulate MAC-based OSI layer 2 Ethernet frames
within layer 4 UDP packets, using 4789 as the default IANA-assigned
destination UDP port number. VXLAN endpoints, which terminate VXLAN
tunnels and may be both virtual or physical switch ports, are known
as VXLAN tunnel endpoints (VTEPs).

VXLAN is an evolution of efforts to standardize on an overlay
encapsulation protocol. It increases scalability up to 16 million
logical networks and allows for layer 2 adjacency across IP networks.
Multicast or unicast with HER (Head-End Replication) is used to
flood BUM (broadcast, unknown destination address, multicast)
traffic.

The VXLAN specification was originally created by VMware, Arista
Networks and Cisco. Other backers of the VXLAN technology include
Huawei, Broadcom, Citrix, Pica8, Cumulus Networks, Dell, Mellanox,
FreeBSD, OpenBSD, Red Hat, Joyent, and Juniper Networks.

VXLAN was officially documented by the IETF in RFC 7348.

Open vSwitch is an example of a software-based virtual network
switch that supports VXLAN overlay networks.

### NVGRE

microsoft competition for VXLAN

https://en.wikipedia.org/wiki/Network_Virtualization_using_Generic_Routing_Encapsulation

<!-- vim: set autoindent expandtab sw=4 syntax=markdown: -->
