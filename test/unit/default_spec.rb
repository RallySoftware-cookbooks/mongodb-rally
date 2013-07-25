require_relative 'spec_helper'

describe '::default' do
  let(:chef_run) { ChefSpec::ChefRunner.new(:step_into => ['yum_repository']) }

  it 'should install stable version of mongo-10gen package by default' do
    chef_run.converge 'mongodb-rally::default'
    expect(chef_run).to install_package 'mongo-10gen'
  end

  it 'should install version of mongo-10gen specified' do
    chef_run.node.set['mongodb-rally']['version'] = 'foo'
    chef_run.converge 'mongodb-rally::default'
    expect(chef_run).to install_package 'mongo-10gen-foo'
  end

  it 'should include 10gen yum repository for mongo-10gen if the platform family is rhel' do
    chef_run.node.automatic_attrs['platform_family'] = 'rhel'
    chef_run.converge 'mongodb-rally::default'
    chef_run.should create_file '/etc/yum.repos.d/10gen.repo'
  end

end
