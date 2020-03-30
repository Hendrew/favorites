class Favorite < ApplicationRecord
  include PgSearch::Model
  include Filterable

  belongs_to :category
  belongs_to :subcategory, optional: true
  belongs_to :user

  validates :title, :link, presence: true

  pg_search_scope :by_title, against: [:title]
  scope :category_id, -> (category_id) { where category_id: category_id }
  scope :subcategory_id, -> (subcategory_id) { where subcategory_id: subcategory_id }
end
