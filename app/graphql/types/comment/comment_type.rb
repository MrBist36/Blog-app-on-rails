# frozen_string_literal: true

module Types
  module Comment
    class CommentType < Types::BaseObject
      field :id, ID, null: false
      field :commenter, String
      field :body, String
      field :article_id, Integer, null: false
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
      field :status, String
    end
  end
end
