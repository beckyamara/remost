class City < ApplicationRecord
  has_one_attached :photo
  has_many :tips
  has_many :trips
end
