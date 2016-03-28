
<!--
-->

https://en.wikipedia.org/wiki/Operating-system-level_virtualization#IMPLEMENTATIONS


Linux Containers LXC
--------------------

https://en.wikipedia.org/wiki/LXC

Namespaces can be split using the `unshare()` system call and the `unshare`
command line tool.  This splits the following namespaces:

 * mount
 * UTS
 * IPC
 * network
 * user

I haven't tested this yet - but it appears that the pid namespace must be
split using a `clone()` call.  The `unshare(1)` man page claims that pid can
be split using the command - I need to test its behavior.

If the namespace already exists, then the `setns()` system call can be used.

How does the `ip` command move interfaces between namespaces, and how does
it make an interface that spans namespaces?

> **Capture phys interfaces**
> read in the (Networking.md) page about capturing an interface in userspace
> by using the raw Packet socket.

### Mininet

https://github.com/mininet/mininet/wiki/Documentation
https://github.com/mininet/mininet/wiki/Publications
[Stanford NetSeminar - mininet team]( https://www.youtube.com/watch?v=90fBCO1MMTA )
linux network namespace system call
https://www.toptal.com/linux/separation-anxiety-isolating-your-system-with-linux-namespaces
http://www.haifux.org/lectures/299/netLec7.pdf

FreeBSD
-------

https://en.wikipedia.org/wiki/FreeBSD_jail

OSX Sandboxes
-------------

Does not appear to be appropriate for namespace isolation.

http://www.chromium.org/developers/design-documents/sandbox/osx-sandboxing-design
http://reverse.put.as/wp-content/uploads/2011/09/Apple-Sandbox-Guide-v1.0.pdf
https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man7/sandbox.7.html
https://media.blackhat.com/bh-dc-11/Blazakis/BlackHat_DC_2011_Blazakis_Apple_Sandbox-wp.pdf

<!-- vim: set autoindent expandtab sw=4 syntax=markdown: -->
