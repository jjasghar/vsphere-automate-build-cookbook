#
# Cookbook:: build_cookbook
# Recipe:: provision
#
# Copyright:: 2017, The Authors, All Rights Reserved.

if node['delivery']['change']['stage'] == 'acceptance'
  bash "bootstrap a tk node and clean up other node" do
    cwd delivery_workspace_repo
    code <<-EOH
      STATUS=0
      chef exec kitchen test || STATUS=1
      exit $STATUS
    EOH
  end
end
if node['delivery']['change']['stage'] == 'union'
  bash "One last tk run to verify everything" do
    cwd delivery_workspace_repo
    code <<-EOH
      STATUS=0
      chef exec kitchen test || STATUS=1
      exit $STATUS
    EOH
  end
end
