module Types
  class QueryType < Types::BaseObject
    field :articles, resolver: Resolvers::Articles::ArticlesResolver
    field :comments, resolver: Resolvers::Comments::CommentsResolver
    field :memberships, resolver: Resolvers::Memberships::MembershipsResolver
    field :organizations, resolver: Resolvers::Organizations::OrganizationsResolver
    field :users, resolver: Resolvers::Users::UsersResolver
  end
end
