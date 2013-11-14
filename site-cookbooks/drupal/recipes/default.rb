#
# Cookbook Name:: drupal
# Recipe:: default
#
# Copyright 2013, vasili4
#
# All rights reserved - Do Not Redistribute
#

# set system time
include_recipe "drupal::systime"

# rpm repositories
include_recipe "drupal::repos"

# php with modules
include_recipe "drupal::php"

# apache, nginx, vhosts
include_recipe "drupal::httpd"

# mysql server and db bootstrap
include_recipe "drupal::mysql"

# memcached server
include_recipe "drupal::memcached"

# disable iptables
service "iptables" do
  action [ :stop, :disable ]
end
