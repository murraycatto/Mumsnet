require 'rails_helper'

RSpec.describe Admin::CategoriesController, type: :controller do

  before(:each) do
    @category =  FactoryBot.create(:category)
    @product =  FactoryBot.create(:product)
  end

  let(:valid_attributes) {
    {
      name:"Test Category 2",
      product_ids:[@product.id]
    }
  }

  let(:invalid_attributes) {
    {
      name:""
    }
  }

  login_user

  describe "GET #index" do
    it "assigns categories and renders index" do
      get :index
      expect(assigns(:categories)).to eq(Category.all)
      expect(response).to render_template(:index)
      expect(response).to be_success
    end
  end


  describe "GET #show" do
    it "assigns category and renders show" do
      get :show, params: {id: @category.id}
      expect(assigns(:category)).to eq(@category)
      expect(response).to render_template(:show)
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "assigns category and renders new" do
      get :new
      expect(assigns(:category)).to be_a_new(Category)
      expect(response).to render_template(:new)
      expect(response).to be_success
    end
  end


  describe "GET #edit" do
    it "assigns the category and renders edit" do
      get :edit, params: {id: @category.id}
      expect(assigns(:category)).to eq(@category)
      expect(response).to render_template(:edit)
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Category" do
        expect {
          post :create, params: {category: valid_attributes}
        }.to change(Category, :count).by(1)
      end

      it "redirects to the created category" do
        post :create, params:{category: valid_attributes}
        expect(assigns(:category).products.last).to eq(@product)
        expect(response).to redirect_to(admin_category_path(Category.last))
      end
    end

    context "with invalid params" do
      it "renders the new template and assigns errors to category" do
        post :create, params: {category: invalid_attributes}
        expect(response).to render_template(:new)
        expect(assigns(:category).errors.empty?).to eq(false)
      end
    end
  end

  # describe "PUT #update" do
  #   context "with valid params" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }
  #
  #     it "updates the requested category" do
  #       category = Category.create! valid_attributes
  #       put :update, params: {id: category.to_param, category: new_attributes}, session: valid_session
  #       category.reload
  #       skip("Add assertions for updated state")
  #     end
  #
  #     it "redirects to the category" do
  #       category = Category.create! valid_attributes
  #       put :update, params: {id: category.to_param, category: valid_attributes}, session: valid_session
  #       expect(response).to redirect_to(category)
  #     end
  #   end
  #
  #   context "with invalid params" do
  #     it "returns a success response (i.e. to display the 'edit' template)" do
  #       category = Category.create! valid_attributes
  #       put :update, params: {id: category.to_param, category: invalid_attributes}, session: valid_session
  #       expect(response).to be_success
  #     end
  #   end
  # end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          name:"New Test Category"
        }
      }

      it "updates the requested category" do
        put :update, params: {id: @category.id, category: new_attributes}
        @category.reload
        expect(@category.name).to eq(new_attributes[:name])
      end

      it "redirects to the category" do
        put :update, params: {id: @category.id, category: valid_attributes}
        expect(response).to redirect_to(admin_category_path(@category))
      end

    end

    context "with invalid params" do
      it "renders the edit template and assigns errors" do
        put :update, params: {id: @category.id, category: invalid_attributes}
        expect(response).to render_template(:edit)
        expect(assigns(:category).errors.empty?).to eq(false)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested category" do
      expect {
        delete :destroy, params: {id: @category.id}
      }.to change(Category, :count).by(-1)
    end

    it "redirects to the category list" do
      delete :destroy, params: {id: @category.id}
      expect(response).to redirect_to(admin_categories_url)
    end
  end

end
