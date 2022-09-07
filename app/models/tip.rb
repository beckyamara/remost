class Tip < ApplicationRecord
  belongs_to :city
  belongs_to :user
  has_many :bookmarked_places
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
