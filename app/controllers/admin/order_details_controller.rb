class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

  def update
    is_updated = true
    @orders = OrderDetail.find(params[:id])
    @order = @orders.order
    @order_details = @order.order_details.all
    if @orders.update(order_detail_params)
      # １つ製作中で注文ステータスも制作中
      if @orders.making_status == "production"
        @order.status = 2
        @order.save
      end
      # 全て製作完了で発送準備中
      @order_details.each do |order_detail|
        if order_detail.making_status != "don"
          is_updated = false
        end
      end
      if is_updated == true
        @order.status = 3
        @order.save
      end
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
