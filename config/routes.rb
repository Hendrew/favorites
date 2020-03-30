Rails.application.routes.draw do
  devise_for :users
  resources :categories, except: :show do
    resources :subcategories, except: :show
  end
  resources :favorites, except: :show do
    collection do
      get :subcategories
    end
  end
  root 'favorites#index'
end
