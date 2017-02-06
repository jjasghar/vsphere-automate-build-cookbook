#
# Cookbook:: build_cookbook
# Recipe:: provision
#
# Copyright:: 2017, The Authors, All Rights Reserved.

if node['delivery']['change']['stage'] == 'acceptance'
  bash "bootstrap a tk node" do
    cwd delivery_workspace_repo
    code <<-EOH
  STATUS=0
    chef exec kitchen test || STATUS=1
    exit $STATUS
  EOH
  end
end
if node['delivery']['change']['stage'] == 'union'
  bash "upload the cookbook to the chef server" do
  cwd delivery_workspace_repo
  code <<-EOH
  STATUS=0
    chef exec kitchen test || STATUS=1
    exit $STATUS
  EOH
  end
end
