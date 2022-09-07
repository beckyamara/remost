class City < ApplicationRecord
  has_one_attached :photo
  has_many :tips
  has_many :trips
  has_many :users

  geocoded_by :name
  after_validation :geocode, if: :will_save_change_to_name?
end
