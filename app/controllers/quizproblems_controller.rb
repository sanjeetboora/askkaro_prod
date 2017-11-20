class QuizproblemsController < ApplicationController
  before_action :set_quizproblem, only: [:show, :edit, :update, :destroy]

  # GET /quizproblems
  # GET /quizproblems.json
  def index
    @quizproblems = Quizproblem.all
  end

  # GET /quizproblems/1
  # GET /quizproblems/1.json
  def show
  end

  # GET /quizproblems/new
  def new
    @quizproblem = Quizproblem.new
  end

  # GET /quizproblems/1/edit
  def edit
  end

  # POST /quizproblems
  # POST /quizproblems.json
  def create
    @quizproblem = Quizproblem.new(quizproblem_params)

    respond_to do |format|
      if @quizproblem.save
        format.html { redirect_to @quizproblem, notice: 'Quizproblem was successfully created.' }
        format.json { render :show, status: :created, location: @quizproblem }
      else
        format.html { render :new }
        format.json { render json: @quizproblem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quizproblems/1
  # PATCH/PUT /quizproblems/1.json
  def update
    respond_to do |format|
      if @quizproblem.update(quizproblem_params)
        format.html { redirect_to @quizproblem, notice: 'Quizproblem was successfully updated.' }
        format.json { render :show, status: :ok, location: @quizproblem }
      else
        format.html { render :edit }
        format.json { render json: @quizproblem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quizproblems/1
  # DELETE /quizproblems/1.json
  def destroy
    @quizproblem.destroy
    respond_to do |format|
      format.html { redirect_to quizproblems_url, notice: 'Quizproblem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quizproblem
      @quizproblem = Quizproblem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quizproblem_params
      params.require(:quizproblem).permit(:statement, :marks, :option, :correctoption, :quiz_id)
    end
end
