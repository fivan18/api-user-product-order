Rails.application.routes.draw do
  resources :products
  resources :users
  resources :orders

  post 'login', to: 'access_tokens#create'
  delete 'logout', to: 'access_tokens#destroy'
  post 'sign_up', to: 'registrations#create'
  get 'dashboard', to: 'dashboard#index'
end
