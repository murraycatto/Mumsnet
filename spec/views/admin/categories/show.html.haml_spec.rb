require 'rails_helper'

RSpec.describe "admin/categories/show", type: :view do
  before(:each) do
    @category = assign(:category, FactoryBot.create(:category))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Test Category/)
  end
end
