class AddUserColumnToShares < ActiveRecord::Migration[5.2]
  def change
    add_reference :shares, :user
  end
end
