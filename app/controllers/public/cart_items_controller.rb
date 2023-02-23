class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items.all
    @cart_item = current_customer.cart_items.new
    @total = @cart_items.inject(0) { |sum, item| sum + item.sub_total }

  end

  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to public_cart_items_path, notice: "個数を変更しました"
    else
      render :index, notice: "個数を変更できませんでした"
    end
  end

  def destroy_all
    @cart_items = current_customer.cart_items
    if @cart_items.destroy_all
      redirect_to public_cart_items_path
    else
      render :index
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to public_cart_items_path
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if @cart_item.save
      redirect_to public_cart_items_path
    else
      session[:cart_item] = @cart_item.attributes.slice(*cart_item_params.keys)
      @genres = Genre.all
      @item = Item.find_by(id:@cart_item.item_id)
      redirect_to item_path(@item.id), flash: {alert: '※個数を選択して下さい'}
    end
  end

  private
    def cart_item_params
      params.require(:cart_item).permit(:amount, :item_id,:image)
    end
end
