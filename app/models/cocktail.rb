class Cocktail < ApplicationRecord
  validates :name, presence: true
  validates :instructions, presence: true
  validates :alcoholic, presence: true
end
