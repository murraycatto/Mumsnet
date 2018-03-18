Rails.application.routes.draw do
  namespace :admin do
    resources :categories
    resources :products
    root :to => "products#index"
  end
end
