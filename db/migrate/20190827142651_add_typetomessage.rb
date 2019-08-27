class AddTypetomessage < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :content_type, :string, default: "text"
  end
end
