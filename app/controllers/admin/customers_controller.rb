class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.page(params[:page])
  end

  def show
    @customers = Customer.find(params[:id])
  end

  def create
  end

  def edit
     @customers = Customer.find(params[:id])
  end

  def update
     @customers = Customer.find(params[:id])
    if@customers.update(customer_params)
      redirect_to admin_customer_path(@customers.id)
    else
      redirect_to admin_genres_path
    end
  end

  private
  def customer_params
  params.require(:customer).permit(:id,:last_name,:first_name,:last_name_kana,:first_name_kana,:email,:encrypted_password,:postal_code,:address,:is_deleted,:telephone_number)
  end
end
