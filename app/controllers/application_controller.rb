class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :addnotes

  rescue_from "Exception", with: :forbidden


  def addnotes
    @note = Note.new
    @question=Question.new
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  def forbidden(exception)
    render template: 'errors/not_found_error', layout: 'layouts/application', status: 404 
  end

end