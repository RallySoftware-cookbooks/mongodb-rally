require 'cookbook/development/test/unit/chefspec'

module ChefSpec::API

  module YumMatchers

    def add_yum_repository(resource_name)
      ChefSpec::Matchers::ResourceMatcher.new(:yum_repository, :add, resource_name)
    end

  end
end
