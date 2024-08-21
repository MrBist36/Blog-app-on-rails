module Types
  module Profiles

    class ProfilesResolver < BaseResolver
      type [Type::Profile::ProfileType], null: false

      def resolve
        Profile.all
      end

    end
  end
end
