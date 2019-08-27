class AddAvatarToConversations < ActiveRecord::Migration[5.2]
  def change
    add_column :conversations, :avatar, :string
  end
end
