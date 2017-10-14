class Trend < ActiveRecord::Base
  has_many :follows
  acts_as_followable

  def followed_by user_id, trend_id
    Follow.where(followable_type: "Trend",follower_id: user_id,followable_id: trend_id).length > 0
  end

  def follow_string user_id,trend_id
    if (followed_by user_id,trend_id)
      return true
    else
      return false
    end
  end
end
