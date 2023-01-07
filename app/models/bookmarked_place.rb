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
end
