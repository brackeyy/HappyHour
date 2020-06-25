class AddCodeToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :code, :string
  end
end
