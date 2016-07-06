package "apache2"

# remove default apache2 config
# default_path = "/etc/apache2/sites-enabled/"
# execute "rm -f #{default_path}" do
#   only_if { File.exists?(default_path) }
# end

# start apache2
service "apache2" do
  supports [:status, :restart]
  action :start
end

# set custom apache2 config
template "/etc/apache2/sites-enabled/#{node['app']}" do
  source "apache.conf.erb"
  mode 0644
  owner node['user']['name']
  group node['group']
  notifies :restart, "service[apache2]", :delayed
end