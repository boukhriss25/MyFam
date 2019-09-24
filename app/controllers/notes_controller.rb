class NotesController < ApplicationController
  before_action :set_family, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  def index
    @collaborations = Collaboration.where(user: current_user).select do |subsc|
      Collaboration.find(subsc.collaboration_id).family_id == @family.id
    end
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_family
    @family = Family.find(params[:family_id])
  end
end
