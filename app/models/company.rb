class Company < ApplicationRecord
  has_many :users
  has_many :cities, through: :users
  # belongs_to :admin, class_name: "User", foreign_key: :admin_id
  validates :name, presence: true
  validates :slack_sub_domain, presence: true
end
