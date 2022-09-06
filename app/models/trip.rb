class Trip < ApplicationRecord
  belongs_to :city
  belongs_to :user
  has_many :bookmarked_users
end
