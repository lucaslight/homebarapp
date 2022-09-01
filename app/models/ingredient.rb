class Ingredient < ApplicationRecord
  has_many :measurements
  has_many :cocktails, through: :measurements

  has_many :cabinets
  has_many :users, through: :cabinets

  validates :name, presence: true
end
