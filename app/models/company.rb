class Company < ApplicationRecord
  has_many :users
  has_many :cities, through: :users
  has_many :places
  # belongs_to :admin, class_name: "User", foreign_key: :admin_id
  validates :name, presence: true
  validates :company_code, presence: true, uniqueness: true
  validates :slack_sub_domain, presence: true
  validates :email_domain, presence: true, format: { with: /@/,
    message: "Please include @ in the email domain. Example: @test.com" }
end
