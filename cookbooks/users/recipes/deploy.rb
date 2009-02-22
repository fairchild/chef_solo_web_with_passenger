### TODO: Dry this up.

user = "deploy"
home = "/var/www/sites/u/app"

user "deploy" do
  comment "Deploy User"
  home home
  shell "/bin/zsh"
end

["var/www", "/var/www/sites", "/var/www/sites/u", home, "#{home}/.ssh"].each do |dir|
  directory dir do
    owner user
    group user
    mode (dir.include?('.ssh') ? 0500 : 0755)
  end
end

template "/#{home}/.ssh/authorized_keys" do
  owner user
  group user
  mode 0400
  source "id_rsa.pub.erb"
end
