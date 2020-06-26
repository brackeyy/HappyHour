class RemoveUserFromSubscription < ActiveRecord::Migration[6.0]
  def change
    remove_column :subscriptions, :user_id
  end
end
