require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  before(:each) do
    @category =  FactoryBot.create(:category)
    @product =  FactoryBot.create(:product)
    @product.product_categories.create(category_id:@category.id)
  end

  describe "GET #index" do
    it "assigns products and categories" do
      get :index
      expect(assigns(:categories)).to eq(Category.where(id: ProductCategory.all.select(:category_id)))
      expect(assigns(:products)).to eq(Product.all)
      expect(response).to render_template(:index)
      expect(response).to be_success
    end
  end

end
