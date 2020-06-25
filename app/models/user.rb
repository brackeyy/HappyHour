class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :orders
  has_many :subscriptions, through: :orders
  has_many :bars
  has_many :bookings, dependent: :destroy
  has_many :offers, through: :bars
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :premium, inclusion: {in: (1..3)}
end
