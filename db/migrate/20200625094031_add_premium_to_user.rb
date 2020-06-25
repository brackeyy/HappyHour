class AddPremiumToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :premium, :integer
  end
end
