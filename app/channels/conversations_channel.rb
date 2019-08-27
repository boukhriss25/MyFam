class ConversationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "conversations_#{params[:conversation_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
