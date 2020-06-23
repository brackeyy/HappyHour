class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.text :description
      t.datetime :start_time
      t.integer :duration
      t.references :bar, null: false, foreign_key: true

      t.timestamps
    end
  end
end
