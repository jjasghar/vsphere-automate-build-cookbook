#
# Cookbook:: chefdk
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

chef_ingredient 'chefdk' do
  action :install
  version '1.2.22'
end
