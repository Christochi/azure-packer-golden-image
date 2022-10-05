# Firewall Rule Role

This role configures firewall rule for your server. There are tasks for ufw and iptables.
`ufw.yml` configures ufw firewall, `iptables.yml` configures iptables, `iptable-module.yml` configures iptables using iptable ansible module.

To select any of above tasks, see below:

#### Usage Example
~~~
# put the name of the firewall rule task you want to call
firewall_file: iptables.yml
~~~

