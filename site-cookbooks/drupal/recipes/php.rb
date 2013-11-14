#
# Cookbook Name:: drupal
# Recipe:: php
#
# Copyright 2013, vasili4
#
# All rights reserved - Do Not Redistribute
#
# install php with modules


# rpm repositories
include_recipe "drupal::repos"

# PHP (from remi repository)
include_recipe "php"

# uninstall apc - application fails with "magic" stack trace ...
package "php-pecl-apc" do
	action :remove
end


%w{
  php-mysql
  php-mbstring
  php-pecl-memcache php-pecl-memcached php-pecl-xdebug
  php-gd php-soap php-xml  
  php-pear-phing
  php-process
  php-mcrypt
  php-magickwand
}.each do |pkg|
  package pkg do
    action :install
  end
end
