##
# Temporary until apt-get repositories have libapache2-mod-passenger.
script "add_additional_apt_sources" do
  interpreter "bash"
  user "root"
  code <<-EOH
    apt-get install wget
    sh -c 'echo "deb http://apt.brightbox.net hardy main" > /etc/apt/sources.list.d/brightbox.list'
    sh -c 'wget -q -O - http://apt.brightbox.net/release.asc | apt-key add -'
    apt-get update
  EOH
end

node[:packages].each do |p|
  package p
end
