
<!--
-->

Network Testing
---------------

Mininet provides network testing using Linux containerization
for network namespaces.

https://github.com/mininet/mininet

[Introduction to Mininet]( https://www.youtube.com/watch?v=jmlgXaocwiE )

Userspace Bridge
----------------

 * Capture physical interface using `packet(7)` socket in `RAW` mode.
 * Create TAP interface in a specific netns maybe.

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

<!-- vim: set autoindent expandtab sw=4 syntax=markdown: -->
