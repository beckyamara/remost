class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :photo
  has_many :bookmarked_places
  has_many :bookmarked_users
  has_many :tips
  has_many :trips
  belongs_to :city
  belongs_to :company
  # has_one :company
  # accepts_nested_attributes_for :company
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
