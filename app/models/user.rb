class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :bookmarked_places
  has_many :bookmarked_users
  has_many :tips
  has_many :trips
  belongs_to :city
  belongs_to :company, optional: true
  # has_one :company
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
