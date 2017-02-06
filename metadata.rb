name 'vsphere_demo'
maintainer 'JJ Asghar'
maintainer_email 'jj@chef.io'
license 'Apache 2.0'
description 'Installs/Configures chefdk'
long_description 'Installs/Configures chefdk'
version '1.0.2'

%w(ubuntu debian redhat centos).each do |os|
  supports os
end

depends 'chef-ingredient'
