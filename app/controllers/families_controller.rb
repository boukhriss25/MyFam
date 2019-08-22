class FamiliesController < ApplicationController
  before_action :set_family, only: [:show, :edit, :update, :destroy]
  def index
    @families = current_user.families
  end

  def show
    @users = @family.users
    @user_convos = current_user.conversations.where(family: @family)
    @all_convos = @family.conversations
  end

  def new
    @family = Family.new
  end

  def create
    @family = Family.new(family_params)
    @membership = Membership.new(user: current_user, family: @family)
    if @family.save && @membership.save
      redirect_to family_path(@family)
    else
      render :new
    end
  end

  def edit
    @users = @family.users
    @membership = Membership.new
    # @user = User.new
  end

  def update
    if @family.update(family_params)
      redirect_to family_path(@family)
    else
      render :edit
    end
  end

  def destroy
    @family.destroy
    redirect_to families_path
  end

  private

  def set_family
    @family = Family.find(params[:id])
  end

  def family_params
    params.require(:family).permit(:name, :avatar)
  end
end
