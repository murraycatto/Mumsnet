require 'rails_helper'

RSpec.describe Admin::ProductsController, type: :controller do

  before(:each) do
    @product =  FactoryBot.create(:product)
  end

  let(:valid_attributes) {
    {
      title:"Test Title",
      description:"Test Description"
     }
  }

  let(:invalid_attributes) {
    {
      title:"",
      description:""
     }
  }

  login_user

  describe "GET #index" do
    it "assigns products" do
      get :index
      expect(assigns(:products)).to eq(Product.all)
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "assigns the product" do
      get :show, params: {id: @product.id}
      expect(assigns(:product)).to eq(@product)
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "assigns a product" do
      get :new
      expect(assigns(:product)).to be_a_new(Product)
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "assigns the product" do
      get :edit, params: {id: @product.id}
      expect(assigns(:product)).to eq(@product)
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Product" do
        expect {
          post :create, params: {product: valid_attributes}
        }.to change(Product, :count).by(1)
      end

      it "redirects to the created product" do
        post :create, params:{product: valid_attributes}
        expect(response).to redirect_to(admin_product_path(Product.last))
      end
    end

    context "with invalid params" do
      it "renders the new template and assigns errors to product" do
        post :create, params: {product: invalid_attributes}
        expect(response).to render_template(:new)
        expect(assigns(:product).errors.empty?).to eq(false)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          title:"New Test Title",
          description:"New Test Description"
        }
      }

      it "updates the requested product" do
        put :update, params: {id: @product.id, product: new_attributes}
        @product.reload
        expect(@product.title).to eq(new_attributes[:title])
        expect(@product.description).to eq(new_attributes[:description])
      end

      it "redirects to the product" do
        put :update, params: {id: @product.id, product: valid_attributes}
        expect(response).to redirect_to(admin_product_path(@product))
      end

    end

    context "with invalid params" do
      it "renders the edit template and assigns errors" do
        put :update, params: {id: @product.id, product: invalid_attributes}
        expect(response).to render_template(:edit)
        expect(assigns(:product).errors.empty?).to eq(false)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested product" do
      expect {
        delete :destroy, params: {id: @product.id}
      }.to change(Product, :count).by(-1)
    end

    it "redirects to the products list" do
      delete :destroy, params: {id: @product.id}
      expect(response).to redirect_to(admin_products_url)
    end
  end

end
