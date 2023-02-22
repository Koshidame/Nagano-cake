class Admin::HomesController < ApplicationController
  def top
    @orders = OrderDetail.page(params[:page])
  end
end
