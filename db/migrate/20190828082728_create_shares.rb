class CreateShares < ActiveRecord::Migration[5.2]
  def change
    create_table :shares do |t|
      t.references :conversation, foreign_key: true
      t.references :document, foreign_key: true

      t.timestamps
    end
  end
end
