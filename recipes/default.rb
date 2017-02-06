#
# Cookbook:: chefdk
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

chef_ingredient 'chefdk' do
  action :install
  version '1.2.22'
end

package 'nginx' do
  action :install
end

template "/var/www/html/index.nginx-debian.html" do
  source "index.html.erb"
  owner "root"
  group "root"
  mode "0644"
end

service "nginx" do
  supports :status => true, :restart => true, :truereload => true
  action [ :enable, :start ]
end
