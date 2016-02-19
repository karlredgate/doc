IPTables Notes
==============

## How Do I Block an IP Address on My Linux server?

How do I block an IP address or subnet under Linux operating system?

In order to block an IP on your Linux server you need to use iptables
tools (administration tool for IPv4 packet filtering and NAT) and
netfilter firewall. First you need to log into shell as root user. To
block an IP address you need to type the iptables command as follows:


### Syntax to block an IP address under Linux

```
iptables -A INPUT -s IP-ADDRESS -j DROP
```

Replace IP-ADDRESS with your actual IP address. For example, if you wish
to block an ip address 65.55.44.100 for whatever reason then type the
command as follows:

```
# iptables -A INPUT -s 65.55.44.100 -j DROP
```

If you have IP tables firewall script, add the above rule to your script.

If you just want to block access to one port from an ip 65.55.44.100 to
port 25 then type command:

```
# iptables -A INPUT -s 65.55.44.100 -p tcp --destination-port 25 -j DROP
```

The above rule will drop all packets coming from IP 65.55.44.100 to port
mail server port 25.

### CentOS / RHEL / Fedora Block An IP And Save It To Config File

Type the following two command:

```
# iptables -A INPUT -s 65.55.44.100 -j DROP
# service iptables save
```

### How Do I Unblock An IP Address?

Use the following syntax (the -d options deletes the rule from table):

```
# iptables -D INPUT -s xx.xxx.xx.xx -j DROP
# iptables -D INPUT -s 65.55.44.100 -j DROP
# service iptables save
```

## Iptables Drop IP Address

How do I block particular IP addresses or host with the iptables command
under Linux?

You need to use the following syntax to drop an IP address or host with
the iptables command.

Warning examples may block access to your computerWARNING! These examples
may block your computer if not executed with proper care. Be careful
when applying these settings on remote servers over ssh session.

### Block Incoming Request From IP 1.2.3.4

The following command will drop any packet coming from the IP address
1.2.3.4:

```
/sbin/iptables -I INPUT -s {IP-HERE} -j DROP
/sbin/iptables -I INPUT -s 1.2.3.4 -j DROP
```

You can also specify an interface such as eth1 via which a packet was
received:

```
/sbin/iptables -I INPUT -i {INTERFACE-NAME-HERE} -s {IP-HERE} -j DROP
/sbin/iptables -I INPUT -i eth1 -s 1.2.3.4 -j DROP
```
Please note that when the "!" argument is used before the interface name,
the sense is inverted:

```
/sbin/iptables -I INPUT ! -i {INTERFACE-NAME-HERE} -s {IP-HERE} -j DROP
/sbin/iptables -I INPUT ! -i eth1 -s 1.2.3.4 -j DROP
```
 
If the interface name ends in a "+", then any interface which begins
with this name will match. If this option is omitted, any interface name
will match:

```
/sbin/iptables -I INPUT  -i {INTERFACE-NAME-HERE}+ -s {IP-HERE} -j DROP
/sbin/iptables -I INPUT  -i br+ -s 1.2.3.4 -j DROP
```
 
You can replace -I INPUT (insert) with -A INPUT (append) rule as follows:

```
/sbin/iptables -A INPUT  -s 1.2.3.4 -j DROP
/sbin/iptables -i eth1 -A INPUT  -s 1.2.3.4 -j DROP
```
 
#### How Do I Block Subnet (xx.yy.zz.ww/ss)?

Use the following syntax to block 10.0.0.0/8 on eth1 public interface:

```
# /sbin/iptables -i eth1 -A INPUT -s 10.0.0.0/8 -j DROP
```

#### How Do I Block and Log Dropped IP Address Information?

You can turn on kernel logging of matching packets with LOG target
as follows:

```
# /sbin/iptables -i eth1 -A INPUT -s 10.0.0.0/8 -j LOG --log-prefix "IP DROP SPOOF A:"
```

The next rule will actually drop the ip / subnet:

```
# /sbin/iptables -i eth1 -A INPUT -s 10.0.0.0/8 -j DROP
```

#### How Do I View Blocked IP Address?

Simply use the following command:

```
# /sbin/iptables -L -v
```

OR

```
# /sbin/iptables -L INPUT -v
```

OR

```
# /sbin/iptables -L INPUT -v -n
```

Sample outputs:

```
Chain INPUT (policy ACCEPT 3107K packets, 1847M bytes)
 pkts bytes target     prot opt in     out     source               destination
    0     0 DROP       all  --  br+    any     1.2.3.4              anywhere
    0     0 DROP       all  --  !eth1  any     1.2.3.4              anywhere
    0     0 DROP       all  --  !eth1  any     1.2.3.4              anywhere       
```

#### How Do I Search For Blocked IP Address?

Use the grep command as follows:

```
# /sbin/iptables -L INPUT -v -n | grep 1.2.3.4
```

#### How Do I Delete Blocked IP Address?

First, you need to display blocked IP address along with line number
and other information, enter:

```
# iptables -L INPUT -n --line-numbers
# iptables -L INPUT -n --line-numbers | grep 1.2.3.4
```

Sample outputs:

```
num   pkts bytes target     prot opt in     out     source               destination
1        0     0 DROP       0    --  *      *       116.199.128.1        0.0.0.0/0
2        0     0 DROP       0    --  *      *       116.199.128.10       0.0.0.0/0
3        0     0 DROP       0    --  *      *       123.199.2.255        0.0.0.0/0
```

To delete line number 3 (123.199.2.255), enter:

```
# iptables -D INPUT 3
```

Verify the same, enter:

```
# iptables -L INPUT -v -n
```

You can also use the following syntax:

```
# iptables -D INPUT -s 1.2.3.4 -j DROP
```

### How Do I Save Blocked IP Address?

If you are using Redhat / RHEL / CentOS / Fedora Linux, type the
following command:

```
# iptables -D INPUT -s 1.2.3.4 -j DROP
##########################
#////// command to save iptables ///////#
##########################
# /sbin/service iptables save
# less /etc/sysconfig/iptables
# grep '1.2.3.4' /etc/sysconfig/iptables
```

For all other Linux distributions use the iptables-save command to dump
the contents of an IP Table to a file:

```
# iptables-save > /root/myfirewall.conf
```

Please not that you need to run the 'iptables-save' or 'service iptables
save' as soon as you add or delete the ip address.

#### A Note About Restoring Firewall

To restore your firewall use the iptables-restore command to restore IP
Tables from a file called /root/myfirewall.conf, enter:

```
# iptables-restore < /root/myfirewall.conf
```

### How Do I Block Large Number Of IP Address or Subnets?

You need to write a shell script as follows:

```
#!/bin/bash
_input="/root/blocked.ip.db"
IPT=/sbin/iptables
$IPT -N droplist
egrep -v "^#|^$" x | while IFS= read -r ip
do
	$IPT -A droplist -i eth1 -s $ip -j LOG --log-prefix "IP BlockList "
	$IPT -A droplist -i eth1 -s $ip -j DROP
done < "$_input"
# Drop it
$IPT -I INPUT -j droplist
$IPT -I OUTPUT -j droplist
$IPT -I FORWARD -j droplist
```

See also: iptables: Read a List of IP Address From File And Block

### Block Outgoing Request From LAN IP 192.168.1.200?

Use the following syntax:

```
# /sbin/iptables -A OUTPUT -s 192.168.1.200 -j DROP
# /sbin/service iptables save
```

You can also use FORWARD default chainswhen packets send through another
interface. Usually FORWARD used when you setup Linux as a router:

```
# /sbin/iptables -A FORWARD -s 192.168.1.200 -j DROP
# /sbin/service iptables save
```

----

## Iptables: Unblock / Delete an IP Address Listed in IPtables Tables

I am a brand new user of a Linux iptables and I can't find how to
instruct my iptables to delete or unblock an IP address listed in iptables
firewall. I'm using Debian Linux version. Can you help please?

Iptables is used to set up, maintain, and inspect the tables of IP packet
filter rules in the Linux kernel. You can delete one or more rules from
the selected chain. There are two versions of this command: the rule can
be specified as a number in the chain (starting at 1 for the first rule)
or a rule to match.

### List existing chains

Type the following command to list current IPs in tables:

```
iptables -L -n
iptables -L -n -v
iptables -L chain-name -n -v
iptables -L spamips -n -v
```

#### List existing chains with line number

To display line number along with other information, enter:

```
iptables -L INPUT -n --line-numbers
iptables -L OUTPUT -n --line-numbers
iptables -L OUTPUT -n --line-numbers | less
iptables -L spamips -n -v --line-numbers
iptables -L spamips -n -v --line-numbers | grep 202.54.1.2
```

```
Chain droplist (3 references)
num  pkts bytes target  prot opt in  out source            destination
1       0     0 LOG     0    --  *   *   116.199.128.0/19  0.0.0.0/0    LOG flags 0 level 4
                                                                        prefix `LASSO DROP Block'
2       0     0 DROP    0    --  *   *   116.199.128.0/19  0.0.0.0/0
3       0     0 LOG     0    --  *   *   116.50.8.0/21     0.0.0.0/0    LOG flags 0 level 4
                                                                        prefix `LASSO DROP Block'
4       0     0 DROP    0    --  *   *   116.50.8.0/21     0.0.0.0/0
5       0     0 LOG     0    --  *   *   128.199.0.0/16    0.0.0.0/0    LOG flags 0 level 4
                                                                        prefix `LASSO DROP Block'
6       0     0 DROP    0    --  *   *   128.199.0.0/16    0.0.0.0/0
7       0     0 LOG     0    --  *   *   132.232.0.0/16    0.0.0.0/0    LOG flags 0 level 4
                                                                        prefix `LASSO DROP Block'
8       0     0 DROP    0    --  *   *   132.232.0.0/16    0.0.0.0/0
9     342 23317 LOG     0    --  *   *   134.175.0.0/16    0.0.0.0/0    LOG flags 0 level 4
                                                                        prefix `LASSO DROP Block'
10    342 23317 DROP    0    --  *   *   134.175.0.0/16    0.0.0.0/0
11      0     0 LOG     0    --  *   *   134.33.0.0/16     0.0.0.0/0    LOG flags 0 level 4
                                                                        prefix `LASSO DR
```

You will get the list of all blocked IP. Look at the number on the left,
then use number to delete it. For example delete line number 10 (subnet
`134.175.0.0/16`), enter:

```
iptables -D INPUT 10
```

You can also use the following syntax to delete / unblock an IP use the
following syntax:

```
iptables -D INPUT -s xx.xxx.xx.xx -j DROP
iptables -D INPUT -s xx.xxx.xx.xx/yy -j DROP
iptables -D spamlist -s 202.54.1.2 -d 0/0 -j DROP
iptables -D spamlist -s 202.54.1.2/29 -d 0/0 -j DROP
```

Finally, make sure you save the firewall. Under CentOS / Fedora / RHEL /
Redhat Linux type the following command:

```
# service iptables save
```

On a related note I recommend getting a good Linux command line and
netfilter Firewall (iptables) book to understand all technical mumbo
jumbo.

## ipset

You can create an ipset. This way you can add as many IPs to the set as
you need without modifying the iptables ruleset.

```
ipset -N myset iphash
ipset -A myset 1.1.1.1
ipset -A myset 2.2.2.2
```

Or, in your case, use the output of your script, and read it with
something like:

```
while read a; do ipset -A myset "$a"; done < <(your script here)
```

And the reference it in your iptables rules:

```
iptables -A INPUT -m set --set myset src -j DROP
```

Read the manpage for more details and options.

There are also other ways to mitigate a DDOS attack using iptables
directly. Read the iptables manpage section about the connlimit and
recent modules.

## Rate Limit

You can also use iptables to limit the rate of incoming connections. For
example if you do not want more than 200 connections per minute from
a source:

```
iptables -I INPUT -p tcp --dport 80 -m state --state NEW -m recent \
         --set
iptables -I INPUT -p tcp --dport 80 -m state --state NEW -m recent \
         --update --seconds 60 --hitcount 200 -j DROP
```
