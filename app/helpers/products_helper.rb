module ProductsHelper

  def cats(product)
    cat_ids = ""
    product.category_ids.each do |cat_id|
      cat_ids += " cat-#{cat_id}"
    end
    cat_ids
  end

end
