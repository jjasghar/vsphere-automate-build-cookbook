#
# Cookbook:: build_cookbook
# Recipe:: syntax
#
# Copyright:: 2017, The Authors, All Rights Reserved.

if node['delivery']['change']['stage'] == 'verify'
  bash "foodcritic in da house" do
    cwd delivery_workspace_repo
    code <<-EOH
  STATUS=0
    chef exec "foodcritic . --exclude spec -f any -t ~supermarket" || STATUS=1
    exit $STATUS
  EOH
  end
end
