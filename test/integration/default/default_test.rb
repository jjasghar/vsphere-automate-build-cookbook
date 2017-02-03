# # encoding: utf-8

# Inspec test for recipe chefdk::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe file('/usr/bin/chef') do
  it { should exist }
  it { should be_symlink }
end
