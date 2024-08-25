module Mutations
  module Profiles
    class CreateProfile < BaseMutation
      argument :full_name, String
      argument :gender, String
      argument :date_of_birth, String
      argument :address, String
      argument :user_id, ID
      argument :organization_id, ID

      field :profile, type: Types::Profile::ProfileType, null: false
      field :errors, [String], null: false

      def resolve(full_name:, gender:, date_of_birth:, address:, organization_id:)
        organization = Organization.find(organization_id)
        raise GraphQL::ExecutionError, "Organization not found!" if organization.nil?

        user = Organization.users.find_by(user_id)
        raise GraphQL::ExecutionError, "No Users!" if user.nil?

        profile = Organization.users.profile.new(full_name: full_name, gender: gender,
        date_of_birth: date_of_birth, address: address, organization_id: organization_id)

        if profile.save
          {profile: profile, errors: []}
        else
          {profile: [], errors: [profile.errors.full_messages]}
        end

      end
    end
  end
end



