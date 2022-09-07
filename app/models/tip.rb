class Tip < ApplicationRecord
  acts_as_favoritable
  belongs_to :city
  belongs_to :user
  has_many :bookmarked_places

  validates :location, presence: true
  validates :content, presence: true
  validates :name, presence: true
  validates :category, presence: true
end
