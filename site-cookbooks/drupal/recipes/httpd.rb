#
# Cookbook Name:: drupal
# Recipe:: httpd
#
# Copyright 2013, vasili4
#
# All rights reserved - Do Not Redistribute
#
# install apache, nginx and vhosts

# APACHE
include_recipe "apache2"
include_recipe "apache2::mod_php5"
include_recipe "apache2::mod_rewrite"
include_recipe "apache2::mod_expires"

# NGINX
include_recipe "nginx"

template "#{node['nginx']['dir']}/backends.conf" do
	source "nginx_backends.conf.erb"
	owner "root"
	group "root"  
	mode 00644
end

template "#{node['nginx']['dir']}/proxy_options.conf" do
	source "nginx_proxy_options.conf.erb"
	owner "root"
	group "root"  
	mode 00644
end

template "#{node['nginx']['dir']}/nginx.conf" do
	source "nginx.conf.erb"
	owner "root"
	group "root"  
	mode 00644
end

# drupal vhost (nginx)
template "#{node['nginx']['dir']}/sites-available/drupal.vagrant" do
	source "nginx_drupal.conf.erb"
	owner "root"
	group "root"  
	mode 00644
	variables(
		:host => "drupal.vagrant"
		)
	end

nginx_site "drupal.vagrant" do
	enable true
end

# drupal vhost (apache)
web_app "drupal.vagrant" do
	server_name "drupal.vagrant"
	server_aliases [ "drupal.vagrant" ]
	docroot "/vagrant/src/drupal/www"
	fqdn node['fqdn']
	directory_index %w{index.php}
	allow_override "All"
	drupal_staticroot "/vagrant/src/drupal/www"
	port "8080"
end

# phpmyadmin vhost (nginx)
template "#{node['nginx']['dir']}/sites-available/drupal.phpmyadmin" do
	source "nginx_drupal.conf.erb"
	owner "root"
	group "root"
	mode 00644
	variables(
		:host => "drupal.phpmyadmin"
		)
	end

nginx_site "drupal.phpmyadmin" do
	enable true
end

# drupal vhost (apache)
web_app "drupal.phpmyadmin" do
	server_name "drupal.phpmyadmin"
	server_aliases [ "drupal.phpmyadmin" ]
	docroot "/vagrant/src/phpmyadmin"
	fqdn node['fqdn']
	directory_index %w{index.php}
	allow_override "All"
	drupal_staticroot "/vagrant/src/phpmyadmin"
	port "8080"
end

group "vagrant" do
	members [node['nginx']['group'], node['apache']['user']]
	action :modify
end

group "#{node['apache']['group']}" do
	members ['vagrant']
	action :modify
end
