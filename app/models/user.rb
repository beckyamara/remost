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

  def current_city(date)
    if self.trips.where('start_date <= ?', date).where('end_date >= ?', date).count > 0
      self.trips.where('start_date <= ?', date).where('end_date >= ?', date).first.city
    else
      self.city
    end
  end
end
