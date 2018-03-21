class Product < ApplicationRecord
  # Associations
  has_many :product_categories
  has_many :categories, through: :product_categories, dependent: :destroy
  # Validations
  validates_presence_of :title,:description

end
