class AddDefaultValueToExpiredAttribute < ActiveRecord::Migration[6.0]
  def change
    change_column :offers, :expired, :boolean, default: false
  end
end
