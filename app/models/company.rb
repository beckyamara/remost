class Company < ApplicationRecord
  has_many :users
  # belongs_to :admin, class_name: "User", foreign_key: :admin_id
end
