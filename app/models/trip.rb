class Trip < ApplicationRecord
  belongs_to :city
  belongs_to :user

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates_comparison_of :end_date, greater_than_or_equal_to: :start_date

  def width
    "#{((((end_date - start_date) + 1) / Time.days_in_month(start_date.month, start_date.year)) * 100).to_f}%"
  end

  def left
    p ((start_date.day.to_f - 1) / Time.days_in_month(start_date.month, start_date.year)).to_f
    "#{(((start_date.day.to_f - 1) / Time.days_in_month(start_date.month, start_date.year)).to_f * 100).to_f}%"
  end
end
