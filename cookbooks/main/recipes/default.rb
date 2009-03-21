include_recipe "gems"
include_recipe 'applications'
include_recipe "packages"
include_recipe "packages::iptables"
include_recipe "packages::sshd"
