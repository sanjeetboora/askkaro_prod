class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers ,foreign_key: :question_id,dependent: :destroy
  has_many :likes
  has_many :follows
  has_many :users,through: :answers
  validates :content ,presence: true,uniqueness: { case_sensitive: false,message: "Question already exist" }
# validates :title,uniqueness: true, :message=>"Question alredy exists", on: 'create'
  acts_as_followable
  acts_as_likeable

  has_many :taggings
  has_many :tags, through: :taggings

  acts_as_taggable_on :tags
  # acts_as_taggable
  def answerfeed question_id
    Answer.where(question_id: question_id).order(:created_at)
  end

  def self.search(search)
    if search

      where('content ILIKE ?', "%#{search}%")
    else
      all
    end
  end
  def liked_by user_id, question_id
    Like.where(likeable_type: "Question",liker_id: user_id,likeable_id: question_id).length > 0
  end

  def like_string user_id,question_id
    if (liked_by user_id,question_id)
      return true
    else
      return false
    end
  end

  def followed_by user_id, question_id
    Follow.where(followable_type: "Question",follower_id: user_id,followable_id: question_id).length > 0
  end

  def follow_string user_id,question_id
    if (followed_by user_id,question_id)
      return true
    else
      return false
    end
  end

end
