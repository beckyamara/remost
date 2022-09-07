class User < ApplicationRecord
  acts_as_favoritor
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

 validates :photo, presence: true
 validates :first_name, presence: true
 validates :last_name, presence: true
 validates :open_to, presence: true
 validates :job_title, presence: true
 validates :department, presence: true
 validates :languages, presence: true
 validates :slack_user, presence: true
end
