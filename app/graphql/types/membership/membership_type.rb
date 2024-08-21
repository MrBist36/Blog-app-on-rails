# frozen_string_literal: true

module Types
  module Membership
    class MembershipType < Types::BaseObject
      field :id, ID, null: false
      field :user_id, Integer, null: false
      field :organization_id, Integer, null: false
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    end
  end
end
