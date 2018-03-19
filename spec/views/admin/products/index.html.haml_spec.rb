require 'rails_helper'

RSpec.describe "admin/products/index", type: :view do
  before(:each) do
    assign(:products, [
      FactoryBot.create(:product),
      FactoryBot.create(:product)
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", :text => "Test Title".to_s, :count => 2
    assert_select "tr>td", :text => "Test Description".to_s, :count => 2
  end
end
