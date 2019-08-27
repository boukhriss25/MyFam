class Message < ApplicationRecord
  # after_create :broadcast_message
  belongs_to :user
  belongs_to :conversation
  validates :content, presence: true

  after_create :broadcast_message

  def broadcast_message
    ActionCable.server.broadcast("conversation_#{conversation.id}", {
      message_partial: ApplicationController.renderer.render(
        partial: "messages/other-message",
        locals: { message: self }
      ),
      current_user_id: user.id
    })
  end
end
