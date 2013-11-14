#
# Cookbook Name:: drupal
# Recipe:: mysql
#
# Copyright 2013, vasili4
#
# All rights reserved - Do Not Redistribute
#
# install mysql server

# mysql server
include_recipe "mysql::server"

# install database (includes grants)
execute "mysql" do
  # Chef::Log.info("aloha!")
  command MysqlHelper.dump_file_cmd("/vagrant/src/bootstrap.sql", node)
  user "root"
end