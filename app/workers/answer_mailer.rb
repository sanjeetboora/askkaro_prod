class AnswerMailer
  @queue= :answers_queue
  def self.perform(answer_id,user_id)
    answer=Answer.find(answer_id)
    user=User.find(user_id)
    UserMailer.new_answer(answer).deliver_now
  end
end