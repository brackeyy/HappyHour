class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.string :name
      t.integer :premium, default: 1
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
