class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX }

  has_many :incomes, dependent: :destroy
  has_many :fixedcosts, dependent: :destroy
  has_many :variablecosts, dependent: :destroy
  has_many :savings, dependent: :destroy
end
