##
# Additional packages to install.
%w(iptables irssi zsh strace logrotate sysstat host).each do |p|
  package p
end
