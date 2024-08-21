module Resolvers
  module Memberships

    class MembershipsResolver < BaseResolver
      type [Types::Membership::MembershipType], null: false

      def resolve
        Membership.all
      end
      
    end
  end
end
