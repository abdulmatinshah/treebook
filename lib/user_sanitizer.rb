class User::ParameterSanitizer < Devise::ParameterSanitizer

protected
  def sign_up
    set_params   
  end
  def sign_in
    set_params   
  end
  def account_update
    set_params
  end
  def set_params
    default_params.permit(:first_name, :last_name, :profile_name, :email, :password, :password_confirmation, :current_password)
  end
end