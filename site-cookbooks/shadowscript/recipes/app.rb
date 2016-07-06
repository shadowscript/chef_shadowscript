# Author Eric Caleb / Shadowscript
#The MIT License (MIT)
#Copyright (c) 2016 Shadowscript
#Copyright (c) 2016 Eric Caleb

# create www directory
directory "/home/#{node['user']['name']}/" do
  user node['user']['name']
  group node['group']
  mode 0755
end

# create shared directory structure for app
path = "/home/#{node['user']['name']}/#{node['app']}/shared/config"
execute "mkdir -p #{path}" do
  user node['user']['name']
  group node['group']
  creates path
end

# create database.yml file
template "#{path}/database.yml" do
  source "database.yml.erb"
  mode 0640
  owner node['user']['name']
  group node['group']
end

# # set unicorn config
# template "/etc/init.d/unicorn_#{node['app']}" do
#   source "unicorn.sh.erb"
#   mode 0755
#   owner node['user']['name']
#   group node['group']
# end

# add init script link
# execute "update-rc.d unicorn_#{node['app']} defaults" do
#   not_if "ls /etc/rc2.d | grep unicorn_#{node['app']}"
# end
