class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :likes
  has_many :comments ,dependent: :destroy
  validates :content ,presence: true,length:{maximum:20000,
    too_long: "%{count} characters is the maximum allowed" }
  acts_as_likeable
  def commentfeed answer_id
    Comment.where(answer_id: answer_id).order(created_at: :desc)
  end

  def liked_by user_id, answer_id
    # Like.where(likeable_type: "Question",liker_id: user_id).length > 0
    # puts "*****************************************************************"
    Like.where(likeable_type: "Answer",liker_id: user_id,likeable_id: answer_id).length > 0


  end
  def like_string user_id,answer_id
    if (liked_by user_id,answer_id)
      return true
    else
      return false
    end
  end
end
