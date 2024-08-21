module Resolvers
  module Comments

      class CommentsResolver < BaseResolver
          type [Types::Comment::CommentType], null: true
           argument :user_id, ID, required: true
          
          def resolve(user_id:)
            user = User.find(user_id)
            if user.present?
              if user.comments.present?
                user.comments
              else
                raise ArgumentError, "No Comments!!"
              end
            else
              raise GraphQL::ExecutionError, "No Users!!"
            end
            
          end
      end
  end
end