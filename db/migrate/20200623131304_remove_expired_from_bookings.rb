class RemoveExpiredFromBookings < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :expired, :boolean
  end
end
