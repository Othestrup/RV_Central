class Camper < ApplicationRecord
  #has_many :bookings
  belongs_to :user
  validates :name, :description, :price, presence: true
end
