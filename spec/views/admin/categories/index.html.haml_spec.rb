require 'rails_helper'

RSpec.describe "admin/categories/index", type: :view do
  before(:each) do
    assign(:categories, [
    FactoryBot.create(:category),
    FactoryBot.create(:category,name:"Test Category 2")
    ])
  end

  it "renders a list of categories" do
    render
    assert_select "tr>td", :text => "Test Category".to_s, :count => 1
    assert_select "tr>td", :text => "Test Category 2".to_s, :count => 1
  end
end
