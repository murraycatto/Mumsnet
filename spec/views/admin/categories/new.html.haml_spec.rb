require 'rails_helper'

RSpec.describe "admin/categories/new", type: :view do
  before(:each) do
    @category = assign(:category, Category.new())
  end

  it "renders new category form" do
    render

    assert_select "form[action=?][method=?]", admin_categories_path, "post" do

      assert_select "input[name=?]", "category[name]"
    end
  end
end
