class Booking < ApplicationRecord
  belongs_to :offer
  belongs_to :user
  after_create :generate_code

  def generate_code
    self.code = SecureRandom.hex
    save
  end
end
