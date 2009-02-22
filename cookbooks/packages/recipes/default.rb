##
# Additional packages to install.
%w(iptables irssi zsh strace logrotate sysstat).each do |p|
  package p
end
