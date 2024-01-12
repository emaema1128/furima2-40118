class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postalcode, :prefecture_id, :city, :block, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postalcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :prefecture_id
    validates :city
    validates :block
    validates :phone_number, format: {with: /\A[0-9]{10,11}\z/ }
    validates :user_id
    validates :item_id
    validates :token
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    # 購入情報を保存し、変数purchasに代入する
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    # 住所を保存する
    # purchas_idには、変数purchasのidと指定する
    Address.create(postalcode: postalcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end

end