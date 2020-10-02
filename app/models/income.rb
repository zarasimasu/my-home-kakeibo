class Income < ApplicationRecord
  validates :income_category, numericality: { other_than: 1 }

  with_options presence: true do
    validates :value, :year_month
  end
  belongs_to :user
end
