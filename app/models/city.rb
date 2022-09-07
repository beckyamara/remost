class City < ApplicationRecord
  has_one_attached :photo
  has_many :tips
  has_many :trips
  geocoded_by :aname
  after_validation :geocode, if: :will_save_change_to_name?
end
