class AttemptsController < ApplicationController
  layout 'layout_one'
  helper 'surveys'


  before_filter :load_survey, only: [:new, :create]
  before_action :authenticate_user!

  def index
    @attempts = Survey::Attempt.all
    @surveys = Survey::Survey.active
    byebug
    respond_to do | format | 
      format.html
      format.json { render :json => @attempts }
      format.csv { send_data @attempts.as_csv, filename: "attempts-#{Date.today}.csv" }

    end

  end


  def show
    @attempt = Survey::Attempt.find_by(id: params[:id])

    render :access_error if current_user.id != @attempt.participant_id

  end


  def new

    @participant = current_user


    unless @survey.nil?


      @attempt = @survey.attempts.new
      @attempt.enrollment =params["enrollment"]

      @attempt.answers.build

    end

  end


  def create

    @attempt = @survey.attempts.new(params_whitelist)
    @attempt.enrollment =params["enrollment"]
    @attempt.participant = current_user

    if @attempt.valid? && @attempt.save

      correct_options_text = @survey.correct_options.present? ? 'Thank You' : ''

      redirect_to attempt_path(@attempt.id), notice: "Thank you for answering #{@survey.name}! #{correct_options_text}"

    else

      build_flash(@attempt)   

      @participant = current_user

      render :new

    end

  end


  def delete_user_attempts

    Survey::Attempt.where(participant_id: params[:user_id], survey_id: params[:survey_id]).destroy_all

    redirect_to new_attempt_path(survey_id: params[:survey_id])

  end


  private


  def load_survey

    @survey = Survey::Survey.find_by(id: params[:survey_id])

  end


  def params_whitelist

    if params[:survey_attempt]

      params[:survey_attempt][:answers_attributes] = params[:survey_attempt][:answers_attributes].map { |attrs| { question_id: attrs.first, option_id: attrs.last } }

      params.require(:survey_attempt).permit(Survey::Attempt::AccessibleAttributes)

    end

  end


  # def current_user

  #   view_context.current_user

  # end

end