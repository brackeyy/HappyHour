class Subscription < ApplicationRecord
  has_many :orders
  has_many :users, through: :orders
  monetize :price_cents
end
