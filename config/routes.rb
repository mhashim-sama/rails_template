Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_for :users

  resources :products
  get 'shopping_cart/items', to: 'shopping_carts#items', as: 'shopping_cart_items'
  post 'shopping_cart/items/:product_id', to: 'shopping_carts#add_items', as: 'add_cart_items'
  root "products#index"
end
