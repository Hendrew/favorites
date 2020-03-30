class Subcategory < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :favorites

  validates :name, presence: true
end
