# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/added_question
  def added_question
    UserMailer.added_question
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/new_answer
  def new_answer
    answer = Answer.last
    UserMailer.new_answer(answer)
  end

end
