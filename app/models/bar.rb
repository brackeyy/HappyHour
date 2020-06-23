class Bar < ApplicationRecord
  belongs_to :user
  has_one :offer, dependent: :destroy
  has_many_attached :photos
end
