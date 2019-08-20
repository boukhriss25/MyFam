class FamiliesController < ApplicationController
  before_action :set_family, only: [:show, :edit, :update, :destroy]
  def index
    @families = current_user.families
  end

  def show
  end

  def new
    @family = Family.new
  end

  def create
    @family = Family.new(family_params)

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_family
    @family = Family.find(params[:id])
  end

  def family_params
    params.require(:family).permit(:name, :avatar)
  end
end
