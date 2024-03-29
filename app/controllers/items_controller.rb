class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, except: [:index, :new, :create ]
  before_action :sold_edit, only: :edit

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
  end

  def edit
    unless current_user.id == @item.user_id
      redirect_to root_path 
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(params[:id])
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if current_user.id == @item.user_id
    @item.destroy 
    end
    redirect_to root_path 
  end

  private
  def item_params
    params.require(:item).permit(:image, :title, :explain, :category_id, :prefecture_id, :freight_id, :shipping_id, :shipdate_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def sold_edit
    if @item.purchase.present?
      redirect_to root_path
    end
  end


end
