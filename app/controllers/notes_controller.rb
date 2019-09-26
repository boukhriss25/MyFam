class NotesController < ApplicationController
  before_action :set_family, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  def index
    collaborations = Collaboration.where(user: current_user).select do |collab|
      Note.find(collab.note_id).family_id == @family.id
    end
    sorted_colls = collaborations.sort_by { |coll| coll.note.updated_at }
    @collaborations = sorted_colls.reverse
  end

  def show
    @note = Note.find(params[:id])
    @users = @note.users
    @members = @family.users
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    @note.family = @family
    @collaboration = Collaboration.new(user: current_user, note: @note)
    # if @note.title == Note.find_by(title: @note.title).title
    #   n = Note.where(title: "new list").count + 1
    #   @note.title = "#{@note.title} (#{n})"
    # end
    if @note.save && @collaboration.save
      redirect_to edit_family_note_path(@family, @note)
    else
      render :new
    end
  end

  def edit
    @note = Note.find(params[:id])
    @users = @note.users
    @members = @family.users
  end

  def update
    # break
    @note = Note.find(params[:id])
    @note.update(note_params)
    if params[:content].present?
      redirect_to family_note_path(@family, @note)
    else
      redirect_to edit_family_note_path(@family, @note)
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    redirect_to family_notes_path(@family)
  end

  private

  def set_family
    @family = Family.find(params[:family_id])
  end

  def note_params
    params.require(:note).permit(:title, :content)
  end
end
