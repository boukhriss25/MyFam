class CollaborationsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @family = Family.find(params[:family_id])
    @note = Note.find(params[:note_id])
    if params[:add_user].nil?
      @collaboration = Collaboration.new(user: current_user)
    else
      @collaboration = Collaboration.new(user: User.find_by_email(params[:query]))
    end
    @collaboration.note = @note
    @collaboration.save
    redirect_to edit_family_note_path(@family, @note)
  end

  def destroy
    @collaboration = Collaboration.find_by(user: params[:user].to_i, note_id: params[:id].to_i)
    @collaboration.destroy
    redirect_to family_notes_path(@collaboration.note.family)
  end
end
