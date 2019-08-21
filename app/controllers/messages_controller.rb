class MessagesController < ApplicationController
  # before_action :set_message, only:
  def index
    @messages = Message.where(conversation_id: params[:conversation_id])
  end

  def new
    @conversation = Conversation.find(params[:conversation_id])
    @message = Message.new
  end

  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = Message.new(message_params)
    @message.user = current_user
    raise
    message.save
  end

  private

  # def set_message
   # @message = Message.find(params[:id])
 # end

  def message_params
    params.require(:message).permit(messages[:content], :conversation_id, :user_id)
  end
end
