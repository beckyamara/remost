class BookmarkedPlace < ApplicationRecord
  belongs_to :user
  belongs_to :tip
end
