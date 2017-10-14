class UsersController < ApplicationController
  before_action :authenticate_user!,only: [:update,:edit]
  before_action :check_authorization,only: [:update,:edit]
  before_action :set_user
  def show
    @user=User.find(params[:id])
    @question=Question.where(:user_id => current_user.id)
      @answer=Answer.where(:user_id => current_user.id)
      @followers=current_user.followers(User)

    # byebug
  end

  def edit
    respond_to do |format|

        format.js{  }

    end
  end
  def update
    if @user.update(user_params)
      redirect_to @user
    else
      flash.now[:alert]="Something went wrong Please try again"
      render :edit
    end
  end


  private

  def check_authorization
    unless current_user.id==params[:id].to_i
      redirect_to root_url
    end
  end

  def set_user
      @user=User.find(params[:id])
  end

  def user_params
     params.require(:user).permit(:name,:bio,:avatar)
  end
end
