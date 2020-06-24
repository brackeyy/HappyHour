class ChangeDurationToEndTimeInOffers < ActiveRecord::Migration[6.0]
  def change
    remove_column :offers, :duration
    add_column :offers, :end_time, :datetime
  end
end
