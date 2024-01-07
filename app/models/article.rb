class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :freight
  belongs_to :shipdate
  belongs_to :shipping


    #空の投稿を保存できないようにする
    validates :title, :explain, :category_id, :prefecture_id,
              :freight_id, :shipname_id, :shipdate_id, :price,
              presence: true

    #ジャンルの選択が「---」の時は保存できないようにする
    validates :category_id, numericality: { other_than: 0 , message: "can't be blank"}
    validates :prefecture_id, numericality: { other_than: 0 , message: "can't be blank"}
    validates :freight_id, numericality: { other_than: 0 , message: "can't be blank"}
    validates :shipdate_id, numericality: { other_than: 0 , message: "can't be blank"}
    validates :shipdate_id, numericality: { other_than: 0 , message: "can't be blank"}

end
