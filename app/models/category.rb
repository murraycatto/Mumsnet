class Category < ApplicationRecord
  # Associations
  has_many :product_categories
  has_many :products, through: :product_categories, dependent: :destroy
  # Validations
  validates :name, uniqueness: true
  validates_presence_of :name

end
