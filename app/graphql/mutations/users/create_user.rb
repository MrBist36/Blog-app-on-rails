module Mutations
  module Users
    class CreateUser < BaseMutation
      argument :email, String
      argument :password, String
      argument :password_confirmation, String
      argument :organization_id, ID

      field :user, type: Types::User::UserType, null: false
      field :errors, [String], null: false
      

      def resolve(email:, password:, password_confirmation:, organization_id:)
        organization = Organization.find(organization_id)
        raise GraphQL::ExecutionError, "Organization not found" if organization.nil?

        user = organization.users.new(email: email, password: password,
        password_confirmation: password_confirmation, organization_id: organization_id)
        
        if user.save
          {user: user, errors: []}
        else
          {user: [], errors: [user.errors.full_messages]}
        end
      end
    end
  end
end

