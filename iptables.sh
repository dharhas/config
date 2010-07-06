#!/bin/sh
#
# ----------------------------------------------------------------------------
#
# script to set the iptables firewall rules
#
# http://wiki.archlinux.org/index.php/Simple_stateful_firewall
#
# ----------------------------------------------------------------------------

IPT=/usr/sbin/iptables

# ----------------------------------------------------------------------------

# flush rules and set default policies
$IPT -F
$IPT -X
$IPT -P INPUT DROP
$IPT -P FORWARD DROP
$IPT -P OUTPUT ACCEPT

# ----------------------------------------------------------------------------

# create the chains
$IPT -N OPEN-TCP
$IPT -N OPEN-UDP

# ----------------------------------------------------------------------------

# INPUT chain
$IPT -A INPUT -i lo -j ACCEPT
$IPT -A INPUT -m state --state INVALID -j DROP
$IPT -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
$IPT -A INPUT -p icmp --icmp-type 8 -m state --state NEW -j ACCEPT
$IPT -A INPUT -p udp -m state --state NEW -j OPEN-UDP
$IPT -A INPUT -p tcp --syn -m state --state NEW -j OPEN-TCP
$IPT -A INPUT -p udp -j REJECT --reject-with icmp-port-unreach
$IPT -A INPUT -p tcp -j REJECT --reject-with tcp-rst
$IPT -A INPUT -j REJECT --reject-with proto-unreach

/etc/rc.d/iptables save

# print the rules
$IPT -L;

exit 0
