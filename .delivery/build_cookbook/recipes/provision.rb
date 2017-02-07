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
      chef exec kitchen verify || STATUS=1
      chef exec knife vsphere vm clone acceptance-automate-ubuntu --template ubuntu16-template \
      -f Linux --bootstrap --cips dhcp --dest-folder / --ssh-user admini \
      --node-ssl-verify-mode none --ssh-password admini \
      -r 'recipe[vsphere_demo::default]' || STATUS=1
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
if node['delivery']['change']['stage'] == 'rehearsal'
  bash "One last tk run to verify everything" do
    cwd delivery_workspace_repo
    code <<-EOH
      STATUS=0
      chef exec knife vsphere vm delete acceptance-automate-ubuntu -P -y
      exit $STATUS
    EOH
  end
end
