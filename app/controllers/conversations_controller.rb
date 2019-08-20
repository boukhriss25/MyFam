class ConversationsController < ApplicationController
  before_action :set_conversation, only: [:show, :edit, :update, :destroy]
  def index
    @conversations = Conversation.all
  end

  def show
  end

  def new
    @conversation = Conversation.new
  end

  def create
    @conversation = Conversation.new(conversation_params)
    redirect_to family_conversations_path(@conversation)
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

  def set_horse
    @conversation = Conversation.find(params[:id])
  end

  def conversation_params
    params.require(:conversation).permit(:name, :family_id)
  end
end
