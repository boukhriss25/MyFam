class Message < ApplicationRecord
  include FileHelper
  belongs_to :user
  belongs_to :conversation
  belongs_to :document, optional: true
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

  def document?
    !document.nil?
  end

  def content
    document? ? url_for_display(document.content) : super
  end
end
