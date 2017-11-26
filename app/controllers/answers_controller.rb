class AnswersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :create, :update, :destroy]
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  # GET /answers
  # GET /answers.json
  def index


  end

  # GET /answers/1
  # GET /answers/1.json
  def show
    respond_to do |format|
      format.html {
        @answer=Answer.find(params[:id])
        @comment = Comment.new(answer_id: params[@answer.id])
        @commentfeed=@answer.commentfeed @answer.id

      }
      format.js {}
    end
  end

  # GET /answers/new
  def new
    @answer = Answer.new(question_id: params[:question_id])
  end

  # GET /answers/1/edit
  def edit
  end

  # POST /answers
  # POST /answers.json
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(answer_params)
    @answer.user_id = current_user.id
    respond_to do |format|
      if @answer.save
# byebug
         Resque.enqueue(AnswerMailer,@answer.id,current_user.id)
        # (@question.user).each do |user|
          Notification.create(recipient: @question.user,actor: current_user,action: "Posted",notifiable: @answer,url: @question_path)
        # end
        #  byebug
        (@question.users.uniq).each do |user|
          if user==current_user
            next
          end
          Notification.create(recipient: user,actor: current_user,action: "Posted An Answer",notifiable: @answer.question)
        end
        format.html {redirect_to 'home/questions/', notice: 'Answer was successfully created.'}
        format.js {}
        @comment = Comment.new(answer_id: params[@answer.id])
        @commentfeed=@answer.commentfeed @answer.id
        format.json {render :show, status: :created, location: @answer}

      else
        format.html {render 'home/index'}
        format.json {render json: @answer.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html {redirect_to '/questions/<% question_id %>', notice: 'Answer was successfully updated.'}
        format.json {render :show, status: :ok, location: @answer}
      else
        format.html {render :edit}
        format.json {render json: @answer.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer.destroy
    respond_to do |format|
      format.html {redirect_to '/', notice: 'Answer was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_answer
    @answer = Answer.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def answer_params
    params.require(:answer).permit(:content, :question_id, :user_id)
  end
end
