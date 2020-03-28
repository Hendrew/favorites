Rails.application.routes.draw do
  devise_for :users
  resources :categories, except: :show do
    resources :subcategories, except: :show
  end
  root 'home#index'
end
