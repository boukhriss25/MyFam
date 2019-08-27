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
    if params[:query].present?
      @user = User.find_by(email: params[:query])
      @membership = Membership.new(user: @user, family: @family)
      @membership.save
      Subscription.create(user: @user, conversation: @family.conversations.find_by(name: "Main chat"))
      redirect_to edit_family_path(@family)
      flash[:success] = "Added user successfully"
    else
      @users = @family.users
      flash[:alert] = @membership.errors.full_messages.join(", ")
      render "families/edit"
    end
  end

  def destroy
    @family = Family.find(params[:id])
    @membership = Membership.find_by(user: params[:user].to_i, family_id: params[:id].to_i)
    @membership.destroy
    if @membership.user == current_user
      redirect_to families_path
    else
      redirect_to edit_family_path(@family)
    end
  end

  private

  def membership_params
    params.require(:membership).permit(:user_id)
  end

  # def find_user
  #   User.find(membership_params)
  # end
end
