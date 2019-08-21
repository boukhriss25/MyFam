class ConversationsController < ApplicationController
  before_action :set_conversation, only: [:show, :edit, :update, :destroy]
  def index
    # @family = Family.find(params[:family_id])
    # @user_convos = current_user.conversations.where(family: @family)
    @conversations = Conversation.where(family_id: params[:family_id])
  end

  def show
  end

  def new
    @family = Family.find(params[:family_id])
    @conversation = Conversation.new
  end

  def create
    @family = Family.find(params[:family_id])
    @conversation = Conversation.new(conversation_params)
    @conversation.family = @family
    if @conversation.save
      redirect_to family_conversations_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @conversation.update(conversation_params)
  end

  def destroy
    @conversation.destroy
    redirect_to family_conversations_path(@conversation)
  end

  private

  def set_conversation
    @conversation = Conversation.find(params[:id])
  end

  def conversation_params
    params.require(:conversation).permit(:name, :family_id)
  end
end
