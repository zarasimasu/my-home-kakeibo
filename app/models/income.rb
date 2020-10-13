class Income < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :income_category

  validates :income_category_id, numericality: { other_than: 1 }
  validates :value, format: { with: /\A[0-9]+\z/ }
  validates_numericality_of :value, greater_than_or_equal_to: 1

  with_options presence: true do
    validates :value, :year_month
  end

  belongs_to :user
end
