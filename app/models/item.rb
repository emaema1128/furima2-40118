class Item < ApplicationRecord
  belongs_to :user
  # has_one :purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :freight
  belongs_to :shipdate
  belongs_to :shipping


    #空の投稿を保存できないようにする
    validates :image, :title, :explain, :category_id, :prefecture_id,
              :freight_id, :shipping_id, :shipdate_id, presence: true
    
  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
              presence: true
  end

    #ジャンルの選択が「---」の時は保存できないようにする
    validates :category_id, numericality: { other_than: 0 , message: "can't be blank"}
    validates :prefecture_id, numericality: { other_than: 0 , message: "can't be blank"}
    validates :freight_id, numericality: { other_than: 0 , message: "can't be blank"}
    validates :shipping_id, numericality: { other_than: 0 , message: "can't be blank"}
    validates :shipdate_id, numericality: { other_than: 0 , message: "can't be blank"}

end
