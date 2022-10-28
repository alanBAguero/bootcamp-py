Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "main#index"
  resources :products
  resources :posts
  resources :navbars, except: [:show]
end
