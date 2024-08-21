module Resolvers
  module Users

    class UsersResolver < BaseResolver
      type Types::User::UserType, null:false
      argument :id, ID, required: true

      def resolve(id:)
        user = User.find_by(id: id)

        if user.nil?
          raise GraphQL::ExecutionError, "User not found with ID #{id}"
        end
        user
      end
    end
  end
end