class AddLastSeenColumnToSubscriptions < ActiveRecord::Migration[5.2]
  def change
    add_column :subscriptions, :last_seen, :datetime, default: DateTime.now
  end
end
