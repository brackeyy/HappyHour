class Bar < ApplicationRecord
  belongs_to :user
  has_one :offer, dependent: :destroy

  has_many_attached :photos

  validates :photos, :name, :description, :location, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

end
