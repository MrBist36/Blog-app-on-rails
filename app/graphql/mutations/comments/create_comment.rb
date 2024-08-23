module Mutations
  module Comments
    class CreateComment < BaseMutation
      argument :commenter, String
      argument :body, String
      argument :user_id, ID
      argument :article_id, ID

      field :comment, type: Types::Comment::CommentType, null: false
      field :errors, [String], null: false

      def resolve(commenter:, body:, user_id:, article_id:)
        user = User.find(user_id)
        article = Article.find(article_id)

        raise GraphQL::ExecutionError, "User not found" if user.nil?
        raise GraphQL::ExecutionError, "No Article" if article.nil?

        comment = article.comments.new(commenter: commenter, body: body, user_id: user_id, article_id: article_id)
        if comment.save
          {comment: comment, errors: []}
        else
          {comment: [], errors: [comment.errors.full_messages] }
        end
      end
      
    end
  end
end






