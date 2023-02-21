class Public::OrdersController < ApplicationController
  def new
  end

  def confirm
  end

  def complete
  end

  def create
　　@order = current_customer.orders.new(order_params)
　　@order.save
end

  def index
  end

  def show
  end
  
  private
    def order_params
       params.require(:order).permit(:customer_id, :postal_code,:ddressa,:shipping_cost,:status,:total_payment,:payment_method)
    end
end