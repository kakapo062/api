class AddColumnsToBooks < ActiveRecord::Migration[7.0]
  def change
    add_reference :books, :bookshelf, foreign_key: true
    add_column :books, :cover_image, :string
  end
end
