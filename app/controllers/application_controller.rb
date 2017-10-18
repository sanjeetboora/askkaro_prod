class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :addnotes

  def addnotes
    @note = Note.new
    @question=Question.new
  end

  # def sideques
  #   @questagfeed = []
  #   if params[:question_id]
  #     @question=Question.find(params[:id])
  #     @question.tag_list.each do |tag|
  #       @questagfeed += Question.tagged_with(tag)
  #     end

  #   elsif params[:tag]

  #     @trendtagusers = []
  #     @tre=Trend.where(name: params[:tag]).first

  #     @trendtagusers += @tre.followers(User)

  #   else
  #     @tftags=Question.tag_counts_on(:tags).order('count desc').limit(5)
  #     @tftags.each do |tag|
  #       @questagfeed += Question.tagged_with(tag)
  #     end
  #   end
  # end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end