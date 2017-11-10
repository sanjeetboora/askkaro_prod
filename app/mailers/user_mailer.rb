class UserMailer < ApplicationMailer
 default from: 'askkaro.help@gmail.com'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.added_question.subject
  #
  def added_question(user,question)
    @user=user
    @question = question
    mail(to: @user.email,subject: 'your question is added successfully')

  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.new_answer.subject
  #
  def new_answer(answer)
    @answer = answer
    @question = @answer.question
    @user=@question.user
    mail(to: @user.email,subject: "New answer for #{@question.title}")


  end
end
