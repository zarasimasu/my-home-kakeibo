class Variablecost < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :variablecost_category

  validates :variablecost_category_id, numericality: { other_than: 1 }
  validates :value, format: { with: /\A[0-9]+\z/ }

  with_options presence: true do
    validates :value, :year_month
  end

  belongs_to :user
end
