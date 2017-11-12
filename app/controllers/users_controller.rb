class UsersController < ApplicationController
  before_action :authenticate_user!,only: [:update,:edit]
  before_action :check_authorization,only: [:update,:edit]
  before_action :set_user
  
  def show
    @user=User.find(params[:id])
    @question=Question.where(:user_id => @user.id).paginate(:per_page => 14, :page => params[:page])
    @answer=Answer.where(:user_id => @user.id).paginate(:per_page => 14, :page => params[:page])
    @followers=@user.followers(User)
  end

  def edit
    respond_to do |format|
      format.js{  }
    end
  end

  def update
    if @user.update(user_params)
      if params[:user][:avatar].present?
        render :crop
      else
       redirect_to @user
     end
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
 params.require(:user).permit(:name,:bio,:avatar, :crop_x, :crop_y, :crop_w, :crop_h)
end
end
