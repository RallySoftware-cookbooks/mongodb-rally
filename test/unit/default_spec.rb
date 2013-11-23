require_relative 'spec_helper'

describe 'mongodb-rally::default' do
  let(:kernel) { 'x86_64' }
  subject(:chef_run) do
    ChefSpec::Runner.new do |node|
      node.automatic_attrs[:platform_family] = 'rhel'
      node.automatic_attrs[:kernel][:machine] = kernel
    end.converge described_recipe
  end

  it { should install_package 'mongo-10gen' }

  it { should add_yum_repository('10gen').with(url: /redhat\/os\/x86_64/) }

  context 'when i686' do
    let(:kernel) { 'i686' }
    it { should add_yum_repository('10gen').with(url: /redhat\/os\/i686/) }
  end
end
