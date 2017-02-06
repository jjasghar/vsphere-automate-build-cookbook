#
# Cookbook:: build_cookbook
# Recipe:: deploy
#
# Copyright:: 2017, The Authors, All Rights Reserved.

if node['delivery']['change']['stage'] == 'rehearsal'
  bash "bootstrap a permanent node" do
    cwd delivery_workspace_repo
    code <<-EOH
  STATUS=0
   knife vsphere vm clone automate-ubuntu --template ubuntu16-template -f Linux \
    --bootstrap --cips dhcp --dest-folder / --ssh-user admini \
    --node-ssl-verify-mode none --ssh-password admini -r 'recipe[vsphere_demo::default]' || STATUS=1
  exit $STATUS
  EOH
  end
end
