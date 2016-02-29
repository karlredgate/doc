
<!--
-->

http://aws.amazon.com/blogs/aws/ec2-update-t2-nano-instances-now-available/
http://www.ec2instances.info/

VPC
----

AWS subnets in a VPC do not allow any multicast.
This disables the use of IPv6 since there is no neighbopr discovery without multicast ICMPv6.

https://www.buckhill.co.uk/blog/how-to-enable-broadcast-and-multicast-on-amazon-aws-ec2/2#.Vr3g65MrJL4

There are overlay network solutions that people have tried.
Not outstanding.

https://en.wikipedia.org/wiki/N2n
http://www.ntop.org/
http://cloudar.be/awsblog/multicast-on-aws/

[Overlay Multicast in Amazon Virtual Private Cloud]( https://aws.amazon.com/articles/6234671078671125 )

There is an
[article]( https://cloudonaut.io/private-subnets-are-broken-on-aws/ )
about subnet broken-ness in AWS VPCs.
Really what this describes is the actual privateness.
There is no access to anything outside the private network.
Not even AWS yum services.
This should be viewed as by design.
Access can be provided by a NAT gateway or a proxy on a related public network in the VPC.

<!-- vim: set autoindent expandtab sw=4 syntax=markdown: -->
