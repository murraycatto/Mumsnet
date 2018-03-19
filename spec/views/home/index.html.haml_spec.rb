require 'rails_helper'

RSpec.describe "home/index", type: :view do
  before(:each) do
    @product =  FactoryBot.create(:product)
    @category =  FactoryBot.create(:category)
    @product.product_categories.create(category_id:@category.id)
    @product.save!
    assign(:products, Product.all)
    assign(:categories, Category.where(id: ProductCategory.all.select(:category_id)))
  end

  it "renders a list of categories" do
    render
    assert_select ".control", :text => "Test Category".to_s, :count => 1
    assert_select ".card-header>h3", :text => "Test Title".to_s, :count => 1
  end
end
