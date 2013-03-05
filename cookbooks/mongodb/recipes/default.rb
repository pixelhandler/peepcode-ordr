bash "install mongodb 10gen" do
  cwd Chef::Config[:file_cache_path]
  code <<-EOH
    if [ -x /usr/bin/mongo ]; then
      sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
      sudo touch /etc/apt/sources.list.d/10gen.list
      sudo echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' >> /etc/apt/sources.list.d/10gen.list
      sudo apt-get update
      sudo apt-get install mongodb-10gen
    fi
  EOH
  creates "/usr/bin/mongod"
end
