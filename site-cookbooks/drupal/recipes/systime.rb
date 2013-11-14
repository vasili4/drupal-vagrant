#
# Cookbook Name:: drupal
# Recipe:: httpd
#
# Copyright 2013, vasili4
#
# All rights reserved - Do Not Redistribute
#
# install apache, nginx and vhosts

cookbook_file "/etc/sysconfig/clock" do
	source "clock"
	action :create
end

execute "cp /usr/share/zoneinfo/Europe/Kiev /etc/localtime" do	
end
