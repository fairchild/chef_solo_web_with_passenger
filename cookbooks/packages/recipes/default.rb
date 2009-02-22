##
# Additional packages to install.
%w(irssi zsh strace logrotate sysstat host).each do |p|
  package p
end
