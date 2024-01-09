class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
     @items = Item.all.order("created_at DESC")
  end

  def new
     @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to '/'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    redirect_to root_path unless current_user.id == @item.user_id

  end

  def update
    @item = Item.find(params[:id])

    if @item.update(item_params)
      redirect_to item_path(params[:id])
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :title, :explain, :category_id, :prefecture_id, :freight_id, :shipping_id, :shipdate_id, :price).merge(user_id: current_user.id)
  end
end
