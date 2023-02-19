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
    @item = Item.find(params[:id])
    # @genre = Genre.find(@item.genre_id)
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :introduction, :genre_id, :price, :sales_status)
  end
end
