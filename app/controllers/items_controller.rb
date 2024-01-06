class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    # @items = Item.all
  end

  def new
    # @item = Item.new
  end

  def create
    @items = Item.create(item_params)
    if @items.save
      redirect_to '/'
    else
      render :new, status: :unprocessable_entity
    end
  end



  private
  def item_params
    params.require(:item).permit(:image, :text)
  end
end
