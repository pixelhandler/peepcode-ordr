bash "install phantomjs" do
  cwd Chef::Config[:file_cache_path]
  code <<-EOH
    if [ ! -x /usr/local/bin/phantomjs ]; then
      cd /usr/local/src
      sudo wget http://phantomjs.googlecode.com/files/phantomjs-1.8.2-linux-x86_64.tar.bz2
      sudo tar xvjf phantomjs-1.8.2-linux-x86_64.tar.bz2
      sudo mv phantomjs-1.8.2-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs
    fi
  EOH
  creates "/usr/local/bin/phantomjs"
end
