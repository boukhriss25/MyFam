class MessagesController < ApplicationController
  # before_action :set_message, only:

  def create
    @conversation = Conversation.find(params[:conversation_id])
    @family = @conversation.family
    @message = Message.new(message_params)
    @message.conversation = @conversation
    @message.user = current_user
    if @message.save
      redirect_to family_conversation_path(@family, @conversation)
    else
      render 'conversations/show'
    end
  end

  private

  # def set_message
   # @message = Message.find(params[:id])
 # end

  def message_params
    params.require(:message).permit(:content, :conversation_id, :user_id)
  end
end
