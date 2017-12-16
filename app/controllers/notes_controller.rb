class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]

# TO SHOW ALL NOTES
  def index
    @notes=Note.where(:user_id => current_user.id).order(updated_at: :desc)
  end

# TO SHOW A NOTE
  def show
  end

# FOR NEW NOTE
  def new
    @note = Note.new
  end

# TO EDIT A NOTE
  def edit
  end

# TO CREATE ALL NOTE
  def create
    @note = Note.new(note_params)
  @note.user_id = current_user.id

    respond_to do |format|
      if @note.save
        format.html { redirect_to request.referrer, notice: 'Note was successfully created.' }
        format.js{}
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

# TO UPDATE A NOTE
  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to @note, notice: 'Note was successfully updated.' }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

# TO DELETE ALL NOTE
  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url, notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:title,:content,:user_id)
    end
end
