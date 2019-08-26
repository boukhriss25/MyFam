class Message < ApplicationRecord
  # after_create :broadcast_message
  belongs_to :user
  belongs_to :conversation
  validates :content, presence: true

#   def broadcast_message
#     ActionCable.server.broadcast("conversation_#{conversation.id}", {
#       message_partial: ApplicationController.renderer.render(
#         partial: "messages/message",
#         locals: { message: self, user_is_messages_author: false }
#       ),
#       current_user_id: user.id
#     })
#   end
end
