# MongoDB

Installs [MongoDB][mongo] for Ubuntu.

## TODO

Still needs work, I ended up just executing the commands per instrunctions on the [MongoDB][mongo] site. I put the commands in the [default.rb](cookbooks/mongodb/recipes/default.rb) for reference.

```ruby
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
```

[mongo]: http://docs.mongodb.org/manual/tutorial/install-mongodb-on-ubuntu/ "Install MongoDB on Ubuntu"