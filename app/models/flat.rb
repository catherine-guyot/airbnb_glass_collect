class Flat < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "user_id"
  has_one_attached :photo
  has_many :bookings, dependent: :destroy
end
