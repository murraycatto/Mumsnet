require 'rails_helper'

RSpec.describe "admin/products/show", type: :view do
  before(:each) do
    @product = assign(:product, FactoryBot.create(:product))
  end

  it "renders attributes" do
    render
    expect(rendered).to match(/Test Title/)
    expect(rendered).to match(/Test Description/)
  end
end
