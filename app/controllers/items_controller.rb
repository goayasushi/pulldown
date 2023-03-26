class ItemsController < ApplicationController
  def index
    @items = Item.all.includes(:client)

    respond_to do |format|
      format.html
      format.csv do
        send_data render_to_string, filename: "index.csv", type: :csv
      end
    end
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
