
class QuestionsController < ApplicationController
  before_action :authenticate_user!, only:[:edit, :create, :update, :destroy]
  before_action :set_question, only: [:show, :edit, :update, :destroy]


# TO SHOW A QUESTION
  def show
    respond_to do |format|
      format.html{
        @question=Question.find(params[:id])
        @questagfeed = []
        @question.tag_list.each do |tag|
          @questagfeed += Question.tagged_with(tag)
        end
        @answer = Answer.new(question_id: params[@question.id])
        @answerfeed=@question.answerfeed @question.id
      }
      format.js{  }
    end
  end

# TO EDIT A QUESTION
  def edit
  end

# TO CREATE A QUESTION
  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    list_of_tags=question_params["tag_list"].split(",")
    list_of_tags.each do |tag|
      if Question.tagged_with(tag).length ==0
        var=Trend.new
        var.name=tag
        var.save!
      end
    end
    respond_to do |format|
      if @question.save
        # FOR GENERATING E-MAIL ON NEW QUESTION 
         Resque.enqueue(QuestionMailer,@question.id,current_user.id)
         format.html { redirect_to '/', notice: 'Question was successfully created.' }
         format.js{  }
         format.json { render :show, status: :created, location: @question }
       else
        format.html { render 'home/index',notice: 'Question was successfully destroyed.' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

# TO UPDATE A QUESTION
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

# TO DELETE A QUESTION
  def destroy
    Like.all.where(likeable_type: "Question", likeable_id: @question.id)
    @question.destroy
    respond_to do |format|
      format.html { redirect_to '/', notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_question
    @question = Question.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def question_params
    params.require(:question).permit(:title, :content, :user_id, :tag_list)
  end
end
