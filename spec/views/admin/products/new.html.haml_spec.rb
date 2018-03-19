require 'rails_helper'

RSpec.describe "admin/products/new", type: :view do
  before(:each) do
    @product = assign(:product, Product.new())
  end

  it "renders new product form" do
    render

    assert_select "form[action=?][method=?]", admin_products_path, "post" do

      assert_select "input[name=?]", "product[title]"

      assert_select "textarea[name=?]", "product[description]"
    end
  end
end
