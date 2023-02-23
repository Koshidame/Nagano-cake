class Admin::OrdersController < ApplicationController

  def show
    @orders =Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])
    @total = (@orders.total_payment - @orders.shipping_cost).round.to_s(:delimited)
  end

  def update
     @orders = Order.find(params[:id])
    if@orders.update(order_params)
      redirect_to admin_order_path(@orders.id)
    else
      redirect_to admin_genres_path
    end
  end


  private
    def order_params
     params.require(:order).permit(:id,:customer_id,:postal_code,:address,:name,:shipping_cost,:status,:total_payment,:payment_method)
    end
end
