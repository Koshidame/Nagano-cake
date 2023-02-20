class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end
  
  def show
    @customer = current_customer
  end
  
  def create
  end
  
  def edit
  end
  
  def update
  end
  
  def unsubscribe
  end
  
  def withdrawal
    @customer = Customer.find(params[:id])
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end
  
  private
  def customer_params
  params.require(:customer).permit(:id,:last_name,:first_name,:last_name_kana,:first_name_kana,:email,:encrypted_password,:postal_code,:adress,:is_deleted)
  end
end
