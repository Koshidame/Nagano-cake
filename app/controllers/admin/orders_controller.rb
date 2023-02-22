class Admin::OrdersController < ApplicationController
  
  def show
  @orders =Order.find(params[:id])
  
  end

  def update
  end
private
  def oreder_params
  params.require(:order).permit(:id,:customer_id,:postal_code,:address,:name,:shipping_cost,:status,:total_payment,:payment_method)
  end
end
