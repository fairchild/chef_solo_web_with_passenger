node[:gems].each do |gem|
  gem_package gem[:name] do
    if gem[:version] && !gem[:version].empty?
      version gem[:version]
    end
    if gem[:source]
      source gem[:source]
    end
    action :install
  end
end

bash "gems_github_com" do
  code "gem sources -a http://gems.github.com"
end
