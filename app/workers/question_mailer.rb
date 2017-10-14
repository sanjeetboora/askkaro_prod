class QuestionMailer
  @queue= :questions_queue
  def self.perform(question_id,user_id)
    question=Question.find(question_id)
    user=User.find(user_id)
    UserMailer.added_question(user,question).deliver_now
  end
end