Rails.application.routes.draw do
  resources :orders
  root 'start#index'
end
