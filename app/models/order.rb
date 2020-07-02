class Order < ApplicationRecord
  belongs_to :user
  belongs_to :subscription
  monetize :amount_cents
end
