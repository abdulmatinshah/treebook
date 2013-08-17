class User::ParameterSanitizer < Devise::ParameterSanitizer

protected
  def sign_up
    default_params.permit(:first_name, :last_name, :profile_name, :email, :password, :password_confirmation, :current_password)
  end
  def account_update
    default_params.permit(:first_name, :last_name, :profile_name, :email, :password, :password_confirmation, :current_password)
  end
end