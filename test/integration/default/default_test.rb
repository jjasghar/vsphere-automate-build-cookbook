# # encoding: utf-8

# Inspec test for recipe chefdk::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe file('/usr/bin/chef') do
  it { should exist }
  it { should be_symlink }
end

describe port(80) do
  it { should be_listening }
  its('processes') {should include 'nginx'}
end

describe file('/var/www/html/index.nginx-debian.html') do
  its('type') { should eq :file }
  it { should be_file }
  it { should_not be_directory }
  its('content') { should match (%r{tirefi}) }
end
