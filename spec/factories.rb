FactoryBot.define do
  factory :user do
    email "email@test.com"
    password  "Password123"
  end

  factory :product do
    title "Test Title"
    description  "Test Description"
  end

  factory :invalid_product, class: Product do
    title ""
    description  ""
  end


end
