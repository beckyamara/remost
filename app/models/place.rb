class Place < ApplicationRecord
  belongs_to :city
  belongs_to :company
  has_many :tips
  validates :name, presence: true
  validates :location, presence: true
  validates :category, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
