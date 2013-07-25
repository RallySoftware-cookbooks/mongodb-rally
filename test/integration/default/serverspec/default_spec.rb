require_relative 'spec_helper'

describe package('mongo-10gen') do
  it { should be_installed }
end