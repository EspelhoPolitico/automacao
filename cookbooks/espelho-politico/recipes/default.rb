#
# Cookbook Name:: espelho-politico
# Recipe:: default
#
# Copyright 2015, Espelho Politico
#
# All rights reserved - Do Not Redistribute
#

include_recipe "apache2"
include_recipe "mysql::client"
include_recipe "mysql::server"
include_recipe "mysql::ruby"
include_recipe "ruby"
include_recipe "application"
include_recipe "mysql2_chef_gem"

apache_site "default" do
  enable true
end

mysql_database node['espelho-politico']['database'] do
  connection ({:host => 'localhost', :username => 'root', :password => node['mysql']['server_root_password']})
  action :create
end

mysql_database_user node['espelho-politico']['db_username'] do
  connection ({:host => 'localhost', :username => 'root', :password => node['mysql']['server_root_password']})
  password node['espelho-politico']['db_password']
  database_name node['espelho-politico']['database']
  privileges [:select,:update,:insert,:create,:delete]
  action :grant
end
