class Post < ApplicationRecord
  belongs_to :author

  has_many :elements, dependent: :destroy

  has_one_attached :header_image

  has_many :comments, dependent: :destroy

end
