# frozen_string_literal: true

module Types
  class BookshelfType < Types::BaseObject
    field :id, ID, null: false
    field :user, Types::UserType, null: false
    field :name, String, null: false
    field :books, [Types::BookType], null: false
  end
end
