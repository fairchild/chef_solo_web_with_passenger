script "sshd_disable_root_login" do
  interpreter "bash"
  user "root"
  cwd "/tmp"
  code <<-EOH
    sed 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config > sshd_config
    cp sshd_config /etc/ssh/sshd_config
    chmod 0644 /etc/ssh/sshd_config
    rm sshd_config
  EOH
end

service "ssh" do
  service_name "ssh"
  action :restart
end
