class ItemsController < ApplicationController
  def index
    @items = Item.all.includes(:client)
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:product, :client_id)
  end

end
