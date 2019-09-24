class NotesController < ApplicationController
  before_action :set_family, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  def index
    @collaborations = Collaboration.where(user: current_user).select do |collab|
      Note.find(collab.note_id).family_id == @family.id
    end
  end

  def show
    @note = Note.find(params[:id])
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    @note.family = @family
    @collaboration = Collaboration.new(user: current_user, note: @note)
    if @note.save && @collaboration.save
      redirect_to family_note_path(@family, @note)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @note.destroy
    redirect_to family_notes_path(@family)
  end

  private

  def set_family
    @family = Family.find(params[:family_id])
  end

  def note_params
    params.require(:note).permit(:title)
  end
end
