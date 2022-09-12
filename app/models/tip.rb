class Tip < ApplicationRecord
  belongs_to :city
  belongs_to :user
  has_many :bookmark_places

  validates :location, presence: true
  validates :content, presence: true
  validates :name, presence: true
  validates :category, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
