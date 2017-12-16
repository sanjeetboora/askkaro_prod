class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

# FOR NEW COMMENT
  def new
    @comment = Comment.new(answer_id: params[:answer_id])
  end

# TO EDIT COMMENT
  def edit
  end

# TO CREATE NEW COMMENT
  def create
    @answer = Answer.find(params[:answer_id])
    @comment = @answer.comments.create(comment_params)
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        format.js{  }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

# TO UPDATE COMMENT
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

# TO DELETE COMMENT
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to request.referrer, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content, :user_id, :answer_id)
    end
end
