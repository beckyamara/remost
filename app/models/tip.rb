class Tip < ApplicationRecord
  belongs_to :user
  belongs_to :place

  accepts_nested_attributes_for :place

  validates :content, presence: true

end
