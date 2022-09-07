class City < ApplicationRecord
  has_one_attached :photo
  has_many :tips
  has_many :trips
  has_many :users

  geocoded_by :name
  after_validation :geocode, if: :will_save_change_to_name?

  def current_users(date, company)
    @users = User.where(company: company)
    @users = @users.select do |user|
      user.current_city(date) == self
    end
  end

  def local_users
    self.users
  end
end
