include_recipe "users"
include_recipe "gems"
include_recipe 'applications'
include_recipe "packages::apache2"
include_recipe "packages::iptables"
include_recipe "packages::sshd"
include_recipe "packages"

