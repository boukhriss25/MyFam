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
      redirect_to family_path(@family)
    else
      render 'edit_family_path(@family)'
    end
  end

  def destroy
  end

  private

  def membership_params
    params.require(:membership).permit(:user_id)
  end
end
