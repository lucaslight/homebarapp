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
  validates :age, presence: true
  validate :validate_age

  private

  def validate_age
    if age.present? && age > 18.years.ago.to_d
      errors.add(:age, 'You should be over 18 years old to sign up.')
    end
  end
end
