class Cocktail < ApplicationRecord
  has_many :saved_cocktails, dependent: :destroy

  has_many :measurements
  has_many :ingredients, through: :measurements

  validates :name, presence: true
  validates :instructions, presence: true
  validates :alcoholic, presence: true
end
