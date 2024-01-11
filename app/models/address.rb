class Address < ApplicationRecord
  belongs_to :purchase

  # validates :postalcode, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  # # 0以外の整数を許可する
  # validates :prefecture_id, presence: true, numericality: {other_than: 0, message: "can't be blank"}
  # validates :city, presence: true
  # validates :block, presence: true
  # validates :building, presence: true
  # validates :phone_number, presence: true
  # validates :price, presence: true

end