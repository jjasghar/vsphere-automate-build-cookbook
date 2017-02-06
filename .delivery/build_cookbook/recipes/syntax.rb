#
# Cookbook:: build_cookbook
# Recipe:: syntax
#
# Copyright:: 2017, The Authors, All Rights Reserved.

if node['delivery']['change']['stage'] == 'acceptance'
  bash "foodcritic in da house" do
    cwd delivery_workspace_repo
    code <<-EOH
  STATUS=0
    chef exec "foodcritic . --exclude spec -f any -t ~supermarket" || STATUS=1
    chef exec knife vsphere vm delete automate-ubuntu -P -y
    exit $STATUS
  EOH
  end
end
