class SavedCocktail < ApplicationRecord
  belongs_to :user
  belongs_to :cocktail

  validates :cocktail_id, uniqueness: { scope: :user_id }
end
