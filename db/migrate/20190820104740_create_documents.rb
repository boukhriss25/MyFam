class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.references :family, foreign_key: true
      t.references :user, foreign_key: true
      t.references :folder, foreign_key: true
      t.string :content
      t.string :doc_type

      t.timestamps
    end
  end
end
