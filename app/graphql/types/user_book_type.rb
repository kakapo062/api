# frozen_string_literal: true

module Types
  class UserBookType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, Integer, null: false
    field :book_id, Integer, null: false
    field :status, String
    field :rating, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
