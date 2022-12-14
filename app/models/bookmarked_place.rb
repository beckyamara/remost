class BookmarkedPlace < ApplicationRecord
  belongs_to :place
  belongs_to :user

  # scope :filter_by_city, ->(city) { where "tip.city.name ILIKE ?", "%#{city}%" }
  # scope :filter_by_category, ->(category) { where("tip.category ILIKE ?", "%#{category}%") }
  # scope :filter_by_user, ->(user) { where "tip.user.name ILIKE ?", "%#{user}%" }
  # scope :filter_by_rating, ->(rating) { where("tip.rating LIKE ?", "%#{rating}%") }
end
