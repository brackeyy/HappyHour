class Offer < ApplicationRecord
  belongs_to :bar
  has_many :bookings, dependent: :destroy
end
