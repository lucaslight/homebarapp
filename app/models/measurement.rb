class Measurement < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient

  validates :quantity, presence: true, numericality: { greater_than: 0, only_integer: true }
end
