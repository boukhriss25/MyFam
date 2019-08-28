class AddDocumentToMessages < ActiveRecord::Migration[5.2]
  def change
    add_reference :messages, :document
  end
end
