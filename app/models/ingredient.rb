class Ingredient < ApplicationRecord
  has_many :measurements
  has_many :cocktails, through: :ingredients

  has_many :cabinets
  has_many :users, through: :cabinets

  validates :name, presence: true
end
