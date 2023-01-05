class BookmarkedPlace < ApplicationRecord
  belongs_to :place
  belongs_to :user

  include PgSearch::Model
  pg_search_scope :search_by_city_name_category,
  associated_against: {
    place: [ :name, :category, :location ]
  },
  using: {
    tsearch: { prefix: true }
  }

  # scope :filter_by_city, ->(city) { joins(:place).where "places.city.name ILIKE ?", "%#{city}%" }
  # scope :filter_by_category, ->(category) { joins(:place).where("places.category ILIKE ?", "%#{category}%") }
  # scope :filter_by_user, ->(user) { where "tip.user.name ILIKE ?", "%#{user}%" }
  # scope :filter_by_rating, ->(rating) { where("tip.rating LIKE ?", "%#{rating}%") }
end
