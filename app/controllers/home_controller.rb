class HomeController < ApplicationController
  include ProductsHelper
  def index
    @categories = Category.where(id: ProductCategory.all.select(:category_id))
    # Only show categories with products
    @products = Product.all
  end

end
