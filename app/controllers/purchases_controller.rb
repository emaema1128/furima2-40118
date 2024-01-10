class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:id])
  end

  def new
  end

end
