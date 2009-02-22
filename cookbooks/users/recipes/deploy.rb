### TODO: Dry this up.

user "deploy" do
  comment "Deploy User"
  home "/var/www/sites/u/app"
  shell "/bin/zsh"
end

deploy_directories = [
  "/var/www",
  "/var/www/sites",
  "/var/www/sites/u",
  "/var/www/sites/u/app"
]

deploy_directories.each do |dir|
  directory dir do
    owner "deploy"
    group "deploy"
    mode 0755
  end
end

directory "/var/www/sites/u/app/.ssh" do
  owner "deploy"
  group "deploy"  
  mode 0500
end

template "/var/www/sites/u/app/.ssh/authorized_keys" do
  owner "deploy"
  group "deploy"  
  mode 0400
  source "id_rsa.pub.erb"
end
