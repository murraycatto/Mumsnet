Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
    resources :categories
    resources :products
    root :to => "products#index"
  end

  root :to => "home#index"
end
