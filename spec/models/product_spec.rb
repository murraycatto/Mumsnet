require 'rails_helper'

RSpec.describe Product, type: :model do

  context 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of(:description) }
  end

  context 'associations' do
    it { should have_many(:product_categories) }
    it { should have_many(:categories).through(:product_categories).dependent(:destroy) }
  end

end
