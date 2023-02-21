class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = Address.all
  end

  def edit
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to public_addresses_path, notice: "配送先を登録しました"
    else
      @addresses = Address.all
      render :index
    end
  end

  def update
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to public_addresses_path
  end

  private
    def address_params
      params.require(:address).permit(:postal_code, :address, :name)
    end
end
