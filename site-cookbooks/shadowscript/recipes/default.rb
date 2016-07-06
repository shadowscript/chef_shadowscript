#
# Cookbook Name:: Shadowscript
# Recipe:: default
#
# Copyright 2016, Shadowscript
# Author Eric Caleb / Shadowscript
#The MIT License (MIT)
#Copyright (c) 2016 Shadowscript
#Copyright (c) 2016 Eric Caleb

# update package database
execute "apt-get update"

# install packages
package "telnet"
package "postfix"
package "curl"
package "git-core"
package "zlib1g-dev"
package "libssl-dev"
package "libreadline-dev"
package "libyaml-dev"
package "libsqlite3-dev"
package "sqlite3"
package "libxml2-dev"
package "libxslt1-dev"
package "libpq-dev"
package "build-essential"
package "tree"

# set timezone
bash "set timezone" do
  code <<-EOH
    echo 'Europe/London' > /etc/timezone
    dpkg-reconfigure -f noninteractive tzdata
  EOH
  not_if "date | grep -q 'GMT\|BST'"
end
