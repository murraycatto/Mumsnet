class Product < ApplicationRecord
  # Associations
  has_many :product_categories
  has_many :categories, through: :product_categories, dependent: :destroy
  # Validations
  validates_presence_of :title,:description

  def cats
    cat_ids = ""
    self.category_ids.each do |cat_id|
      cat_ids += " cat-#{cat_id}"
    end
    cat_ids
  end
end
