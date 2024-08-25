module Mutations
  module Articles
    class CreateArticle < BaseMutation
      argument :title, String
      argument :body, String
      argument :user_id, ID
      argument :organization_id, ID

      field :articles, type: Types::Article::ArticleType, null: false
      field :errors, [String], null: false


      def resolve(body:, title:, user_id:, organization_id:)
        user = User.find_by(id: user_id)
        organization = Organization.find_by(id: organization_id)
      
        return { articles: nil, errors: ["Organization not found with given ID"] } if organization.nil?
        return { articles: nil, errors: ["User not found"] } if user.nil?
      
        article = user.articles.new(title: title, body: body,
        organization_id: organization_id, user_id: user_id)
      
        if article.save
          { articles: article, errors: [] }
        else
          { articles: nil, errors: [article.errors.full_messages] }
        end
      end
      
    end
  end
end
