class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      admin_orders_path
    else
      public_path
    end
  end

  def after_sign_out_path_for(resource)
    case resource
    when :admin   # ログアウト時はシンボルが返ってくる
      new_admin_session_path
    when :customer  # ログアウト時はシンボルが返ってくる
      root_path
    end
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name,:first_name,:last_name_kana,:first_name_kana,:telephone_number,:postal_code,:address,])
  end
end
