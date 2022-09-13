class User < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_job_department_name,
  against: [ :job_title, :department, :first_name, :last_name ],
  using: {
    tsearch: { prefix: true }
  }
  scope :filter_by_job, ->(job_title) { where job_title: job_title }
  scope :filter_by_department, ->(department) { where department: department }
  scope :filter_by_languages, ->(languages) { where("languages ILIKE ?", "%#{languages}%") }
  scope :filter_by_open_to, ->(open_to) { where("open_to ILIKE ?", "%#{open_to}%") }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :photo
  has_many :bookmarked_places
  # has_many :bookmarked_users
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

  def current_city(date)
    if self.trips.where('start_date <= ?', date).where('end_date >= ?', date).count > 0
      self.trips.where('start_date <= ?', date).where('end_date >= ?', date).first.city
    else
      self.city
    end
  end

  def bookmarked_tip?(tip)
    bookmarked_places.map(&:tip).include?(tip)
  end
end
