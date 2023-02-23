class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!, except: [:index]

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to public_customers_path, notice: "会員情報を更新しました."
    else
      render :edit
    end
  end

  def unsubscribe
  end

  def withdrawal
    @customer = current_customer
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
