
BGP
-----

Implementations

http://bird.network.cz/
http://www.quagga.net/


https://github.com/ThomasHabets/eggpd
https://github.com/brunorijsman/erlang-bgp

https://github.com/osrg/gobgp

https://github.com/Exa-Networks/exabgp/wiki/Other-OSS-BGP-implementations

http://bgp.potaroo.net/
http://bgpupdates.potaroo.net/instability/bgpupd.html

### Feeds

Google search for "BGP Feed" to find some of these.

Planet lab has a
[doc]( http://www.planet-lab.org/files/pdn/PDN-03-011/pdn-03-011.pdf )
that shows the config for peering with them.

This is from 2015 - so I should have the video.
[BlackHat BGP hack presentation]( https://www.blackhat.com/us-15/briefings.html#bgp-stream )

### ExaBGP

ExaBGP provides a convenient way to implement Software Defined
Networking by transforming BGP messages into friendly plain text
or JSON, which can then be easily handled by simple scripts or your
BSS/OSS.

It is routinely used to improve service resilience and provide
protection against network or service failures. For example, thanks
to the healthcheck backend included, anycasted DNS service failures
can be detected and handled gracefully. To help you get started,
Vincent Bernat put forward a full lab explaining how to best use
this feature.

Also, alone or in conjunction with fastnetmon, it provides network
operators a cost effective DDOS protection solution.

But it is not its only strength, thanks to modern routers' flow
balancing, ExaBGP can also be used to save you money on load
balancers. Other uses include keeping an eye on network changes
done by RIPE or by other networks with GIXLG.

https://github.com/Exa-Networks/exabgp

BGPmon
------

Two different ones.  One was a company acquired by OpenDNS, in turn
acquired by Cisco.

http://www.bgpmon.net/
https://portal.bgpmon.net/register.php
https://portal.bgpmon.net/firsttimelogin.php

The other is at Colorado State University and provides telnet
port with XML output messages.

http://www.bgpmon.io/
http://www.bgpmon.io/join-the-peering.html

https://www.dhs.gov/sites/default/files/publications/csd-catch-2009-massey.pdf

DNS
----

Anycast addresses are usually configured by BGP with a
specific route to whatever is closest to you.  This is used
by the DNS root nameservers and the GTLD nameservers.

 * https://en.wikipedia.org/wiki/Anycast

### OpenDNS

http://www.howtogeek.com/201312/how-to-use-opendns-on-your-router-pc-tablet-or-smartphone/
https://www.opendns.com/
https://threatpost.com/bgp-security-alerts-coming-to-twitter/113843/

RouteViews
----------

University of Oregon.

http://www.routeviews.org/

front page describes several BGP feeds

Cyclops
-------

http://cyclops.cs.ucla.edu/
https://www.nanog.org/meetings/nanog43/presentations/Oliveira_Cyclops_N43.pdf
https://www.nanog.org/meetings/nanog46/presentations/Monday/Ricardo_cyclops_light_N46.pdf
http://www.irl.cs.ucla.edu/~rveloso/papers/cyclops_ccr.pdf

From Videos
-----------

Uses radix tree to store BGP graph

https://en.wikipedia.org/wiki/Radix_tree

Simple BGP
----------

git@github.com:QratorLabs/bird.git
https://github.com/QratorLabs/bird
https://radar.qrator.net/tools/simple-bgp

Software
--------

https://en.wikipedia.org/wiki/Border_Gateway_Protocol
https://en.wikipedia.org/wiki/OpenBGPD
https://en.wikipedia.org/wiki/List_of_open-source_routing_platforms
http://www.openbgpd.org/

Vyatta
------

Vyatta is now defunct.  The project is now VyOS.

https://en.wikipedia.org/wiki/VyOS
https://github.com/vyos

<!-- vim: set autoindent expandtab sw=4 syntax=markdown: -->
