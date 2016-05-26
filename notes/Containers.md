
<!--
-->

https://en.wikipedia.org/wiki/Operating-system-level_virtualization#IMPLEMENTATIONS

Docker and related
------------------

devmapper unionfs
http://www.projectatomic.io/docs/filesystems/
http://www.projectatomic.io/

This is a good article

[How to create a sandbox using the device mapper]( http://www.flaterco.com/kb/sandbox.html )

### CoreOS

CoreOS is like a host OS for a hypervisor - but for containers.
Supports Docker and Rocket

https://en.wikipedia.org/wiki/CoreOS


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

Conversation with David about RedHat
------


https://blog.verbum.org/
https://www.projectatomic.io/
https://en.wikipedia.org/wiki/Unikernel
http://techcrunch.com/2016/01/21/docker-acquires-unikernel-systems-as-it-looks-beyond-containers/
https://www.openshift.org/
https://www.openshift.com/
http://kubernetes.io/
https://github.com/kubernetes/kubernetes
http://www.projectatomic.io/docs/os-updates/

search: starting docker on fedora
https://docs.docker.com/engine/installation/linux/fedora/
https://fedoraproject.org/wiki/Docker

http://linux-vserver.org/index.php?title=util-vserver:Vhashify&oldid=2285

### OSTree

https://git.centos.org/summary/rpms!ostree;jsessionid=1s5gnpfx0pk7xt8a419wnbc8g
https://ostree.readthedocs.io/en/latest/
https://github.com/ostreedev/ostree
https://github.com/cgwalters
https://blog.verbum.org/2014/01/21/ostree-in-action-rpm-ostree-and-switching-trees/
https://wiki.gnome.org/Projects/OSTree/RelatedProjects

makefile for building from OSTree
https://git.gnome.org/browse/ostree/tree/packaging/Makefile.dist-packaging#n11)

Build does not go smoothly out of the box - check the notes in
automation

### Rocket (rkt)

https://kinvolk.io/
https://github.com/coreos/rkt
https://github.com/coreos/rkt/blob/master/Documentation/using-rkt-with-kubernetes.md
https://github.com/coreos/rkt/blob/master/Documentation/using-rkt-with-nomad.md
https://github.com/coreos/rkt/blob/master/Documentation/devel/architecture.md
https://github.com/coreos/rkt/blob/master/Documentation/running-docker-images.md

### Networking?

https://github.com/containernetworking/cni

### Nomad

Nomad is [HashiCorp] project - datacenter aware scheduler for containers.
How does this compare to Jisto?

https://www.nomadproject.io/


<!-- vim: set autoindent expandtab sw=4 syntax=markdown: -->
