class MembershipsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @membership = Membership.new
  end

  def create
    @family = Family.find(params[:family_id])
    @membership = Membership.new(membership_params)
    @membership.family = @family
    if @membership.save
      redirect_to edit_family_path(@family)
      flash[:success] = @membership.errors.full_messages.join(", ")
    else
      @users = @family.users
      flash[:notice] = @membership.errors.full_messages.join(", ")
      render "families/edit"
    end
  end

  def destroy
    # raise
    # Membership.where(user: params[:user], family: @family).destroy
    # @membership = Membership.where(user: params[:user], family_id: params[:family_id])
    @membership.destroy
    redirect_to edit_family_path(@family)
  end

  private

  def membership_params
    params.require(:membership).permit(:user_id)
  end
end
