Rails.application.routes.draw do
  resources :routing_lists
  resources :orders
  root 'start#index'
end
