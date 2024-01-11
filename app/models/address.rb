class Address < ApplicationRecord
  belongs_to :purchase
  
  validates :postalcode, presence: true
  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :block, presence: true
  validates :building, presence: true
  validates :phone_number, presence: true
  validates :price, presence: true

  
end
