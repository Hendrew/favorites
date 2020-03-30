class Favorite < ApplicationRecord
  belongs_to :category
  belongs_to :subcategory, optional: true
  belongs_to :user

  validates :title, :link, presence: true
end
