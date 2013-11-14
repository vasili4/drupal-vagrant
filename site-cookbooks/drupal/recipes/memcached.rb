#
# Cookbook Name:: drupal
# Recipe:: memcached
#
# Copyright 2013, vasili4
#
# All rights reserved - Do Not Redistribute
#
# install memcached


# memcached
include_recipe "memcached"

service "memcached" do
  action [:enable, :start]
end
