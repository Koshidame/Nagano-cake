class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @orders =Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])
    @total = (@orders.total_payment - @orders.shipping_cost).round.to_s(:delimited)
  end

  def update
    @orders = Order.find(params[:id])
    if@orders.update(order_params)
      if @orders.status == "confirm_payment" #ここがおかしい
        @orders.order_details.each do |order_detail|
          order_detail.making_status = 1
          order_detail.save
        end
      end
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
