class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.all
  end

  def new
     @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to '/'
    else
      render :new, status: :unprocessable_entity
    end
  end



  private
  def item_params
    params.require(:item).permit(:image, :title, :explain, :category_id, :prefecture_id, :freight_id, :shipname_id, :shipdate_id, :price).merge(user_id: current_user.id)
  end
end
