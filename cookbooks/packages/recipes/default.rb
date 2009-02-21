##
# Additional packages to install.
%w(zsh strace logrotate sysstat).each do |p|
  package p
end
