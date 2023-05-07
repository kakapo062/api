class User < ApplicationRecord
  has_many :bookshelves
  # 他の関連を必要に応じて追加
end
