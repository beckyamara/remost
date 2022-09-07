class Trip < ApplicationRecord
  belongs_to :city
  belongs_to :user
  has_many :bookmarked_users

  validates :start_date, presence: true
  validates :end_date, presence: true
end
