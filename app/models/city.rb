class City < ApplicationRecord
  has_many :tips
  has_many :trips
end
