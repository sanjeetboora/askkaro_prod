class RegistrationsController < Devise::RegistrationsController
 respond_to :js
  # private
  #
  # # def sign_up_params
  # #   params.require(:user).permit(:name, :email, :password, :password_confirmation)
  # # end
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.for(:sign_up).push(:name, :email, :password, :password_confirmation)
  # end
  # def account_update_params
  #   params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
  # end
end
