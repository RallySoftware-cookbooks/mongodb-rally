require_relative 'spec_helper'

describe file('/etc/yum.repos.d/10gen.repo') do
  it { should be_file }
  it { should be_mode 644 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

describe command('/usr/bin/yum -C repolist | grep 10-gen') do
  it { should return_stdout /10gen RPM Repository/ }
end

describe package('mongo-10gen') do
  it { should be_installed }
end

describe command('/usr/bin/mongo --help') do
  it { should return_stdout /MongoDB shell/ }
end
