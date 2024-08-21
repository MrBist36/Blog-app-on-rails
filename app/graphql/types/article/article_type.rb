# frozen_string_literal: true

module Types
  module Article
    class ArticleType < Types::BaseObject
      field :id, ID, null: false
      field :title, String
      field :body, String
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
      field :status, String
      field :user_id, Integer
      field :organization_id, Integer, null: false
    end
  end
end
