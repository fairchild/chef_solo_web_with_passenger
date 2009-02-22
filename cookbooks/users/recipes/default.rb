include_recipe "users::deploy"

user = "retr0h"
home = "/home/#{user}"

user user do
  comment user
  home home
  shell "/bin/zsh"
end

[home, "#{home}/.ssh"].each do |dir|
  directory dir do
    owner user
    group user
    mode (dir.include?('.ssh') ? 0700 : 0755)
  end
end

template "#{home}/.ssh/authorized_keys" do
  owner user
  group user
  mode 0400
  source "id_rsa.pub.erb"
end
