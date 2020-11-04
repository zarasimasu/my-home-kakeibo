class Saving < ApplicationRecord
  validates :saving, format: { with: /\A[0-9]+\z/ }
  validates_numericality_of :saving, greater_than_or_equal_to: 0

  with_options presence: true do
    validates :saving, :day
  end

  belongs_to :user
end
