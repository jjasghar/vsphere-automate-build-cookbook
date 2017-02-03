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
if node['delivery']['change']['stage'] == 'rehearsal'
  bash "bootstrap a permanent node" do
    cwd delivery_workspace_repo
    code <<-EOH
  STATUS=0
   knife vsphere vm clone automate-ubunut --template ubuntu16-template -f Linux \
    --bootstrap --cips dhcp --dest-folder / --ssh-user admini \
    --node-ssl-verify-mode none --ssh-password admini || STATUS=1
  exit $STATUS
  EOH
  end
end
