class Admin::OrderDetailsController < ApplicationController
  
  def update
    @orders = OrderDetail.find(params[:id])
    if @orders.update(order_detail_params)
      redirect_to admin_order_path(@orders.order_id)
    else
      redirect_to admin_genres_path
    end
  end

   private
    def order_detail_params
     params.require(:order_detail).permit(:id,:order_id,:item_code,:price,:amount,:making_status,:updated_at)
    end

end
