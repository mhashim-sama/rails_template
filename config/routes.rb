Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_for :users

  resources :products
  
  get 'shopping_cart/items', to: 'shopping_carts#items', as: 'shopping_cart_items'
  post 'shopping_cart/products/:product_id', to: 'shopping_carts#add_items', as: 'add_cart_items'
  post 'shopping_cart/items/:item_id', to: 'shopping_carts#remove_items', as: 'remove_cart_items'
  
  post 'cart_items/increment/:item_id', to: 'cart_items#increment_quantity', as: 'increment_item_quantity'
  post 'cart_items/decrement/:item_id', to: 'cart_items#decrement_quantity', as: 'decrement_item_quantity'

  root "products#index"
end
