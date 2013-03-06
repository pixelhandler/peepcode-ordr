cookbook_file "/etc/apt/sources.list.d/10gen.list" do
  path "/etc/apt/sources.list.d/10gen.list"
  action :create_if_missing
end

bash "install mongodb 10gen" do
  cwd Chef::Config[:file_cache_path]
  code <<-EOH
    if [ ! -x /usr/bin/mongo ]; then
      sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
      sudo apt-get update
      sudo apt-get install mongodb-10gen
    fi
  EOH
  creates "/usr/bin/mongod"
end
