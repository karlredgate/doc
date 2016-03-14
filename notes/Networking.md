
<!--
-->

Userspace Bridge
----------------

 * Capture physical interface using `packet(7)` socket in `RAW` mode.
 * Create TAP interface in a specific netns maybe.

### UI for OpenVPN on OSX

tunnelblick
https://www.tunnelblick.net/
https://www.tunnelblick.net/documents.html

### Infinetics

Infinetics was where Reed worked - funcky switch arch.

http://infinetics.com/technology/
http://www.google.com/patents/US20130083701

Raw Sockets
-----------

Some notes on raw sockets
[here]( http://sock-raw.org/papers/sock_raw )

OSX has `PF_NDRV` sockets for raw packets from a device.
Some
[notes here]( https://lists.apple.com/archives/darwin-development/2002/Mar/msg00270.html )
and notes for *golang*
[here]( http://stackoverflow.com/questions/32575558/creating-raw-packets-with-go-1-5-on-macosx ).

<!-- vim: set autoindent expandtab sw=4 syntax=markdown: -->
