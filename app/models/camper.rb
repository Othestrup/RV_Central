class Camper < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many :bookings, dependent: :destroy
  belongs_to :user
  validates :name, :description, :price, presence: true
  has_one_attached :image
end
