class PurchasesController < ApplicationController

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @item = Item.find(params[:item_id])
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      return redirect_to root_path
    else
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    params.require(:order).permit(:price).merge(token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
    amount: order_params[:price],  # 商品の値段
    card: order_params[:token],    # カードトークン
    currency: 'jpy'                 # 通貨の種類（日本円）
  )
  end

end
