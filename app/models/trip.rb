class Trip < ApplicationRecord
  belongs_to :city
  belongs_to :user

  validates :start_date, presence: true
  validates :end_date, presence: true

  def width
    "#{((((end_date - start_date) + 1 ) / Time.days_in_month(start_date.month, start_date.year)) * 100).to_f}%"
  end

  def left
    p ((start_date.day.to_f - 1) / Time.days_in_month(start_date.month, start_date.year)).to_f
    "#{(((start_date.day.to_f - 1) / Time.days_in_month(start_date.month, start_date.year)).to_f * 100).to_f}%"
  end
end
