class AddCounterToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :counter, :integer, default: 0
  end
end
