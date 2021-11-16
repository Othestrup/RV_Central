class User < ApplicationRecord
  has_many :bookings
  has_many :campers

  validates :full_name, presence: true
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
end
