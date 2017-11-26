class SurveysController < ApplicationController

  layout 'layout_one'
  before_filter :load_survey, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!
  def index

    type = view_context.get_survey_type(params[:type])


    query = if type then
              Survey::Survey.where(survey_type: type)
            else
              Survey::Survey
            end

    @surveys = query.order(created_at: :desc).page(params[:page]).per(15)

  end


  def new

    @survey = Survey::Survey.new

  end


  def create
    @survey = Survey::Survey.new(params_whitelist)
    @survey.user_id=current_user.id
    @survey.password=SecureRandom.urlsafe_base64(10)
    @survey.period=params["period"]
    if @survey.valid? && @survey.save
      SurveyMailer.added_survey(current_user, @survey).deliver_now
      default_redirect

    else
      flash[:alert] = "You must add a valid quiz with questions and description"
      render :new

    end

  end


  def edit

  end


  def show
    @survey.destroy
    redirect_to '/surveys'
  end


  def update

    if @survey.update_attributes(params_whitelist)

      default_redirect

    else

      build_flash(@survey)

      render :edit

    end

  end


  def destroy
    @survey.destroy
    default_redirect

  end

  def quiz_confirm_password
    catch=Survey::Survey.find(params[:survey_id])
    if(catch.active==false)
      flash[:alert] = "This test is no longer available for submit"
      redirect_to '/surveys'
    end
    respond_to do |format|
      format.html {
        @survey=Survey::Survey.find(params[:survey_id])

      }
      format.js {}
    end
  end

  def quiz_verfication

    @survey=Survey::Survey.find(params[:survey_id])

   if (@survey.password.eql? params["password"])

    redirect_to new_attempt_path(survey_id: @survey.id,enrollment: params[:enrollment])
   else
     flash[:alert] = "Your given password is incorrect please enter a valid one"
     redirect_to '/surveys'
  end
end

  private


  def default_redirect

    redirect_to surveys_path, notice: I18n.t("surveys_controller.#{action_name}")

  end

  def default_redirect1

    redirect_to '/'

  end


  def load_survey

    @survey = Survey::Survey.find(params[:id])

  end


  def params_whitelist

    params.require(:survey_survey).permit(Survey::Survey::AccessibleAttributes << :survey_type)

  end


end