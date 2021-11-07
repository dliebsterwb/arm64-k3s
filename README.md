# Raspberry Pi k8s Soup-2-Nuts installation 

Ansible = 2.10.13

Blame dliebster 2021/10/19


!Work in Progress!

Scripting of bare OS -> k8s up-and-running on Rasperry Pis.

Ansible inventory for a smaple set of 7 Pi 4b's grouped as laxpi in the hosts.pi file.


Once inventory is established:

ansible-playbook playbooks/<insert playbook name here>


Available modules are: 
* aptupgrade-autoReboot.yaml
* config-os.yaml
* log2ram.yaml
* sethostsfile.yaml

These will be united under a 'site.ymal' once the dst settles..

Please use caution, some items such as disk provision may be destructive to existing installations
  
  
Keeping k3s-ansible around for ideas, it is still 10x slower than k3sup atm tho..
