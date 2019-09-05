class MessagesController < ApplicationController
  # before_action :set_message, only:
  # after_create :broadcast_message

  def create

    @conversation = Conversation.find(params[:conversation_id] || params[:message][:conversation_id])
    @family = @conversation.family
    @message = Message.new(message_params)
    @message.conversation = @conversation
    @message.user = current_user

    # @message.content_type = "url" if Rinku.auto_link(@message.content, :all, 'target="_blank"').html_safe
    # array = URI.extract(@message.content)
    # @message.content_type = "url" if array[0].present?

    regexp = /(https?:\/\/(?:www\.|(?!www))[^\s\.]+\.[^\s]{2,}|www\.[^\s]+\.[^\s]{2,})/
    @message.content_type = "url" if @message.content.scan(regexp).present?

    if @message.save
      Share.create(conversation: @conversation, document: @message.document, user: current_user) if @message.document.present?

    # ActionCable.server.broadcast("conversation_#{conversation.id}", {
    #   message: @message.to_json
    # })
      respond_to do |format|
        # HTTP request -> routes -> controller action -> view
        format.html { redirect_to family_conversation_path(@family, @conversation) }
        format.js
      end
    else
      respond_to do |format|
        # This is not an http request -> view
        format.html { render 'conversations/show' }
        format.js
      end
    end
  end

  private

  # def set_message
   # @message = Message.find(params[:id])
 # end

  def message_params
    params.require(:message).permit(:content, :content_type, :conversation_id, :user_id, :document_id)
  end

end
