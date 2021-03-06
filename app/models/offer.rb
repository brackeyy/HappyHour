class Offer < ApplicationRecord
  belongs_to :bar
  has_many :bookings, dependent: :destroy

  validates :description, :start_time, :end_time, presence: true
  validates_length_of :description, minimum: 5, maximum: 50

end
