class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  # validates :image, presence: true
  # validates :title, presence: true
  # validates :explain, presence: true
  # validates :category_id, presence: true
  # validates :prefecture_id, presence: true
  # validates :freight_id, presence: true
  # validates :title, presence: true
  # validates :shipdate_id, presence: true
  # validates :shipname_id, presence: true
  # validates :price, presence: true
  # validates :title, presence: true

end
