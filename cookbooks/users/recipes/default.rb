include_recipe "users::deploy"

user = "retr0h"
home = "/home/#{user}"

user user do
  comment user
  home home
  shell "/bin/zsh"
end

directory "#{home}/.ssh" do
  owner user
  group user
  mode 0500
end

template "#{home}/.ssh/authorized_keys" do
  owner user
  group user
  mode 0400
  source "id_rsa.pub.erb"
end
