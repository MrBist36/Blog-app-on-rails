module Resolvers
  module Organizations

    class OrganizationsResolver < BaseResolver
      type [Types::Organization::OrganizationType], null: false

      def resolve
        Organization.all
      end
      
    end
  end
end

