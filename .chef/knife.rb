current_dir = File.dirname(__FILE__)

log_level                :info
log_location             STDOUT
node_name                "admini"
client_key               "#{current_dir}/admini.pem"
validation_client_name   "tirefi.re-validator"
validation_key           "#{current_dir}/pems/tirefi.re-validator.pem"
chef_server_url          "https://chef.tirefi.re/organizations/tirefi"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path ["#{current_dir}/../.."]
cache_path              File.expand_path(File.dirname(__FILE__))
ssl_verify_mode         :verify_none

knife[:vsphere_insecure] = true
knife[:vsphere_host] = "172.16.20.2"
knife[:vsphere_user] = "admin@vsphere.local"
knife[:vsphere_pass] = "Cod4can!"
knife[:vsphere_dc] = "Datacenter"

knife[:vra_disable_ssl_verify] = true
knife[:vra_username] = 'vraadmin'
knife[:vra_password] = 'Good1bye!'
knife[:vra_base_url] = 'https://vra71.tirefi.re'
knife[:vra_tenant]   = 'vsphere.local'
