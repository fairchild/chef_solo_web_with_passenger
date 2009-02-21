%w(apache2 apache2-threaded-dev).each do |p|
  package p
end

##
# Postinstall script.
bash "install-apache2-module" do
  code "echo -en '\n\n\n\n\n' | sudo passenger-install-apache2-module"
end

template "/etc/apache2/conf.d/passenger.conf" do
  mode 0644
  source "passenger.conf.erb"
end

service "apache2" do
  supports :restart => true, :reload => true
  action :enable
  subscribes :reload, resources('template[/etc/apache2/conf.d/passenger.conf]'), :immediately
end
