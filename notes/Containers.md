
<!--
-->

Linux Containers LXC
--------------------

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

<!-- vim: set autoindent expandtab sw=4 syntax=markdown: -->
