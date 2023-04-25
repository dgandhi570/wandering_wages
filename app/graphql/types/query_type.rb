module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField
    field :users, resolver: Queries::Users
    field :user, resolver: Queries::User
    field :test_field, String, null: false,
      description: "An example field added by the generator"

    def test_field
      "Hello World!"
    end
  end
end
