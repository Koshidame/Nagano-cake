class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end
  
  def show
    @customers = Customer.find(params[:id])
  end
  
  def create
  end
  
  def edit
  end
  
  def update
  end
  
  private
  def customer_params
  params.require(:customer).permit(:id,:last_name,:first_name,:last_name_kana,:first_name_kana,:email,:encrypted_password,:postal_code,:adress,:is_deleted)
  end
end
