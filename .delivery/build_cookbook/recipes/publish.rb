#
# Cookbook:: build_cookbook
# Recipe:: publish
#
# Copyright:: 2017, The Authors, All Rights Reserved.

bash "upload the cookbook to the chef server" do
  cwd delivery_workspace_repo
  code <<-EOH
  STATUS=0
    chef exec knife cookbook upload vsphere_demo || STATUS=1
    exit $STATUS
  EOH
end
