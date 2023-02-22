class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    @order.shipping_cost = 800
    @order.customer_id = current_customer.id
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.sub_total }
    @order.total_payment = @order.shipping_cost + @total
    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:select_address] == "2"
    else
    end
  end

  def complete
  end

  def create
    @order = current_customer.orders.new(order_params)
    if @order.save!
      redirect_to public_orders_complete_path
    end
  end

  def index
  end

  def show
  end

  private
    def order_params
       params.require(:order).permit(:customer_id, :postal_code,:address,:shipping_cost,:status,:total_payment,:payment_method,:name)
    end
end
