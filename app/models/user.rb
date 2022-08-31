class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  has_many :saved_cocktails
  has_many :cocktails, through: :saved_cocktails

  has_many :cabinets
  has_many :ingredients, through: :cabinets

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birth_date, presence: true
  validate :age_restriction

  private

  def age_restriction
    if (birth_date.to_date + 18.years) < Date.today
      return
    else
      errors.add :birth_date, 'must be older than 18'
    end
  end
end
