class AddPriceToSubscriptions < ActiveRecord::Migration[6.0]
  def change
    add_monetize :subscriptions, :price, currency: { present: false }
  end
end
