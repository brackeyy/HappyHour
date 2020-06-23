class AddExpiredToOffers < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :expired, :boolean
  end
end
