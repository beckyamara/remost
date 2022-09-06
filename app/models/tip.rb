class Tip < ApplicationRecord
  belongs_to :city
  belongs_to :user
  has_many :bookmarked_places
end
