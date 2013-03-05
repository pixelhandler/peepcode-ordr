# deployd

execute "install deployd with npm" do
  command "npm install -g deployd"
  only_if "[ ! -x /usr/local/bin/dpd ]"
  action :run
end
