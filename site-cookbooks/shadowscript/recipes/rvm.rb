# Author Eric Caleb / Shadowscript
#The MIT License (MIT)
#Copyright (c) 2016 Shadowscript
#Copyright (c) 2016 Eric Caleb

# create .bash_profile file
cookbook_file "/home/#{node['user']['name']}/.bash_profile" do
  source "bash_profile"
  mode 0644
  owner node['user']['name']
  group node['group']
end

# install rvm
bash 'install rvm' do
  user node['user']['name']
  cwd "/home/#{node['user']['name']}"
  code <<-EOH
    export HOME=/home/#{node['user']['name']}
    \curl -sSL https://get.rvm.io | bash -s stable
  EOH
  not_if { File.exists?("/home/#{node['user']['name']}/.rvm/bin/rvm") }
end

# install ruby
version_path = "/home/#{node['user']['name']}/.rvm/VERSION"
bash 'install ruby' do
  user node['user']['name']
  cwd "/home/#{node['user']['name']}"
  code <<-EOH
    export HOME=/home/#{node['user']['name']}
    export RVM_ROOT="${HOME}/.rvm"
    export PATH="${RVM_ROOT}/bin:${PATH}"

    rvm install #{node['ruby']['version']}
    rvm global #{node['ruby']['version']}
    echo 'gem: -–no-ri -–no-rdoc' > .gemrc
    .rvm/bin/rvm exec gem install bundler
  EOH
  not_if { File.exists?(version_path) && `cat #{version_path}`.chomp.split[0] == node['ruby']['version'] }
end
