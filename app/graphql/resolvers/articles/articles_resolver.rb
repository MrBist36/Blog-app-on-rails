module Resolvers
  module Articles

      class ArticlesResolver < BaseResolver
          type [Types::Article::ArticleType], null: true
           argument :organization_id, ID
          
          def resolve(organization_id:)
              organization = Organization.find_by(id: organization_id)
              if organization.present?
                  organization.articles
              end
              
          end
      end
  end
end