class Category < ApplicationRecord
  belongs_to :user
  has_many :subcategories

  validates :name, presence: true
end
