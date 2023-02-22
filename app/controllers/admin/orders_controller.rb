class Admin::OrdersController < ApplicationController
  def index
    @orders = Order_detail.all
  end
  
  def edit
  end

  def update
  end

end
