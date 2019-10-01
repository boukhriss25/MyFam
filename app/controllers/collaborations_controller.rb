class CollaborationsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @family = Family.find(params[:family_id])
    @note = Note.find(params[:note_id])
    @members = @family.users
    if params[:add_all]
      @members.each do |m|
        Collaboration.create(user: m, note: @note)
      end
    elsif params[:add_user].nil?
      @collaboration = Collaboration.new(user: current_user)
    else
      @collaboration = Collaboration.new(user: User.find_by_email(params[:query]))
    end
    unless @collaboration.nil?
      @collaboration.note = @note
      @collaboration.save
    end
    redirect_to edit_family_note_path(@family, @note)
  end

  def destroy
    @collaboration = Collaboration.find_by(user: params[:user].to_i, note_id: params[:id].to_i)
    @collaboration.destroy
    redirect_to family_notes_path(@collaboration.note.family)
  end
end
