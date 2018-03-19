class ProductCategory < ApplicationRecord
  # Associations
  belongs_to :product
  belongs_to :category
  # Validations
  validates_presence_of :product,:category

end
