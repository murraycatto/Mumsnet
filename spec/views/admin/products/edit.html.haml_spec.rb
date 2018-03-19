require 'rails_helper'

RSpec.describe "admin/products/edit", type: :view do
  before(:each) do
    @product = assign(:product, FactoryBot.create(:product))
  end

  it "renders the edit product form" do
    render

    assert_select "form[action=?][method=?]", admin_product_path(@product), "post" do

      assert_select "input[name=?]", "product[title]"

      assert_select "textarea[name=?]", "product[description]"
    end
  end
end
