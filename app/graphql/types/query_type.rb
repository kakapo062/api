module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :books, [Types::BookType], null: false

    field :user_books, [Types::UserBookType], null: false

    def user_books
      [{
        id: 1
      }]
    end

    def books
      Book.all
    end
  end
end
