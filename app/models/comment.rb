class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, optional: true

  has_rich_text :comment
end
