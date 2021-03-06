class FamiliesController < ApplicationController
  before_action :set_family, only: [:show, :edit, :update, :destroy]

  def index
    @families = current_user.families
    activities_array = []
    current_user.conversations.each do |convo|
    #   convo.shares.each do |sh|
    #     shares_array << sh
    #   end
    # end
    # sorted_shares = shares_array.sort_by &:created_at
    # @shares = sorted_shares.reverse
      convo.messages.each do |mess|
        activities_array << mess if mess.content_type == "url"
      end
    end

    sorted_activities = activities_array.sort_by &:created_at
    @activities = sorted_activities.reverse
  end

  def show
    @users = @family.users
    @user_convos = current_user.conversations.where(family: @family)
    # @all_convos = @family.conversations
    activities_array = []
    @user_convos.each do |convo|
      # convo.shares.each do |sh|
      #   activities_array << sh
      # end
      convo.messages.each do |mess|
        activities_array << mess if mess.content_type == "url"
      end
    end

    sorted_activities = activities_array.sort_by &:created_at
    @activities = sorted_activities.reverse
  end

  def new
    @family = Family.new
  end

  def create
    @family = Family.new(family_params)
    @membership = Membership.new(user: current_user, family: @family)
    if @family.save && @membership.save
      @conversation = Conversation.create(family: @family, name: "Main chat")
      Subscription.create(user: current_user, conversation: @conversation)
      redirect_to family_path(@family)
      # skipform: params[:skipform]
    else
      render :new
    end
  end

  def edit
    @users = @family.users
    @membership = Membership.new
  end

  def update
    if @family.update(family_params)
      redirect_to family_path(@family)
      # skipform: params[:skipform]
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
