class CreateMedia < ActiveRecord::Migration[5.2]
  def change
    create_table :media do |t|
      t.references :family, foreign_key: true
      t.references :user, foreign_key: true
      t.references :folder, foreign_key: true, optional: true
      t.string :content
      t.string :type

      t.timestamps
    end
  end
end
