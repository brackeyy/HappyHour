class Bar < ApplicationRecord
  belongs_to :user
  has_one :offer, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
