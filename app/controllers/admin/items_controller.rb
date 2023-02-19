class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_product, only: %i[show edit update]

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
      render :edit
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def item_params
    params.require(:product).permit(:image, :name, :introduction, :genre_id, :price, :sales_status)
  end
end
