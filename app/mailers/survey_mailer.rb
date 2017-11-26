class SurveyMailer < ApplicationMailer
	 def added_survey(user,survey)
    @user=user
    @survey = survey
    mail(to: @user.email,subject: 'your quiz is successfully created')

  end
end
