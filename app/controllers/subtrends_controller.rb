class SubtrendsController < ApplicationController
  before_action :set_subtrend, only: [:show, :edit, :update, :destroy]

  # GET /subtrends
  # GET /subtrends.json
  def index
    @subtrends = Subtrend.all
  end

  # GET /subtrends/1
  # GET /subtrends/1.json
  def show
  end

  # GET /subtrends/new
  def new
    @subtrend = Subtrend.new
  end

  # GET /subtrends/1/edit
  def edit
  end

  # POST /subtrends
  # POST /subtrends.json
  def create
    @subtrend = Subtrend.new(subtrend_params)

    respond_to do |format|
      if @subtrend.save
        format.html { redirect_to @subtrend, notice: 'Subtrend was successfully created.' }
        format.json { render :show, status: :created, location: @subtrend }
      else
        format.html { render :new }
        format.json { render json: @subtrend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subtrends/1
  # PATCH/PUT /subtrends/1.json
  def update
    respond_to do |format|
      if @subtrend.update(subtrend_params)
        format.html { redirect_to @subtrend, notice: 'Subtrend was successfully updated.' }
        format.json { render :show, status: :ok, location: @subtrend }
      else
        format.html { render :edit }
        format.json { render json: @subtrend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subtrends/1
  # DELETE /subtrends/1.json
  def destroy
    @subtrend.destroy
    respond_to do |format|
      format.html { redirect_to subtrends_url, notice: 'Subtrend was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subtrend
      @subtrend = Subtrend.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subtrend_params
      params.require(:subtrend).permit(:subtitle, :maintrend_id)
    end
end
