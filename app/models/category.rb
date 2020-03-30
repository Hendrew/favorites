class Category < ApplicationRecord
  belongs_to :user
  has_many :subcategories
  has_many :favorites

  validates :name, presence: true
end
