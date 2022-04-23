Rails.application.routes.draw do
  resources :users
  root to: 'top#index'
  resources :rooms
  resources :entries, except: [:show,:update,:edit], path: :rentals do
    post :confirm, on: :collection
    post :confirm_back, on: :collection
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
