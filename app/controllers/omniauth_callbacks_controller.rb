class OmniauthCallbacksController < ApplicationController
  # FOR AUTHENTICATION WITH FACEBOOK
  def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      flash.notice="Signed In Successfully"
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end
