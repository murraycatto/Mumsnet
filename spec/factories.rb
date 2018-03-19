FactoryBot.define do
  factory :user do
    email "email@test.com"
    password  "Password123"
  end

  factory :product do
    title "Test Title"
    description  "Test Description"
  end

  factory :category do
    name "Test Category"
  end

end
