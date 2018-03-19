require 'rails_helper'

RSpec.describe ProductCategory, type: :model do

  context 'validations' do
    it { should validate_presence_of :category }
    it { should validate_presence_of(:product) }
  end

  context 'associations' do
    it { should belong_to(:product) }
    it { should belong_to(:category) }
  end

end
