# frozen_string_literal: true

module Types
  module Profile
    class ProfileType < Types::BaseObject
      field :id, ID, null: false
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
      field :full_name, String
      field :gender, String
      field :address, String
      field :date_of_birth, GraphQL::Types::ISO8601Date
      field :user_id, Integer
      field :organization_id, Integer
    end
  end
end
