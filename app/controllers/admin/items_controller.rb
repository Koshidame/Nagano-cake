class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def index
  end

  def new
    @item = Item.new
    @genres =Genre.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :introduction, :genre_id, :price, :sales_status)
  end
end
