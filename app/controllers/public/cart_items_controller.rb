class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items.all
    @cart_item = current_customer.cart_items.new
    @total = @cart_items.inject(0) { |sum, item| sum + item.line_total }
    
  end

  def update
  end

  def destroy
  end

  def destroy
  end

  def create
  end
  
  private
    def cart_item_params
      params.require(:cart_item).permit(:amount, :item_id,:image)
    end
end
