class SocializationsController < ApplicationController
  before_filter :load_socializable

  def follow
    current_user.toggle_follow!(@socializable)
    respond_to do |format|
      format.js {}
    end
  end

  def followQuestion
    @question=Question.find(params[:question_id])
    follow=Follow.where(followable_type: "Question",follower_id: current_user.id,followable_id: @question.id).first

    if follow
      current_user.toggle_follow!(@socializable)
      @is_followed=false
    else
      current_user.toggle_follow!(@socializable)
      Notification.create(recipient: @question.user,actor: current_user,action: "Followed Your Question",notifiable: @question)
      @is_followed=true
    end
    respond_to do |format|
      format.js {}
    end
  end
    def followUser
    @user = User.find(params[:user_id])
    follow=Follow.where(followable_type: "User",follower_id: current_user.id,followable_id: @user.id).first

    if follow
      current_user.toggle_follow!(@socializable)
      @is_followed=false
    else
      current_user.toggle_follow!(@socializable)
      #Notification.create(recipient: @user,actor: current_user,action: "Followed",notifiable: @answer)
      @is_followed=true
    end
    respond_to do |format|
      format.js {}
    end
  end
  def followTrend
    @trending=Trend.find(params[:trend_id])
    follow=Follow.where(followable_type: "Trend",follower_id: current_user.id,followable_id: @trending.id).first

    if follow
      current_user.toggle_follow!(@socializable)
      @is_followed=false
    else
      current_user.toggle_follow!(@socializable)
      @is_followed=true
    end
    respond_to do |format|
      format.js {}
    end
  end

  def like
    @question=Question.find(params[:question_id])
    like=Like.where(likeable_type: "Question",liker_id: current_user.id,likeable_id: @question.id).first
    if like
      current_user.toggle_like!(@socializable)
      @is_liked=false
    else
      current_user.toggle_like!(@socializable)
      Notification.create(recipient: @question.user,actor: current_user,action: "Liked Your Question",notifiable: @question)
      @is_liked=true
    end


    respond_to do |format|
      format.js {}
    end
  end

  def likeAnswer
    @answer=Answer.find(params[:answer_id])
    like=Like.where(likeable_type: "Answer",liker_id: current_user.id,likeable_id: @answer.id).first
    if like
      current_user.toggle_like!(@socializable)
      @is_liked=false
    else
      current_user.toggle_like!(@socializable)
      @is_liked=true
    end
    respond_to do |format|
      format.js {}
    end
  end

  private
  def load_socializable
    @socializable =
        case
          when id = params[:question_id] # Must be before :item_id, since it's nested under it.
            Question.find(id)
          when id = params[:user_id]
            User.find(id)
          when id = params[:user_id]
            User.find(id)
          when id = params[:answer_id]
            Answer.find(id)
          when id = params[:trend_id]
            Trend.find(id)

          when id = params[:subtrend_id]
            Subtrend.find(id)
          # when id = params[:category_id]
          #   @community.categories.find_by_id(id)

          else
            raise ArgumentError, "Unsupported socializable model, params: "
            params.keys.inspect
        end
    raise ActiveRecord::RecordNotFound unless @socializable
  end
end
