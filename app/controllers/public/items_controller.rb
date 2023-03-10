class Public::ItemsController < ApplicationController
  
  def index
    @items = Item.page(params[:page]).per(8)
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
  end
  
  private
    def item_params
       params.require(:item).permit(:genre_id, :name,:introduction,:price,:sales_status,:image)
    end

end
