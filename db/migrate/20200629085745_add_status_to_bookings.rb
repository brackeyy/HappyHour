class AddStatusToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :claimed, :boolean, default: false
  end
end
