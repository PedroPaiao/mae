Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :minimum_versions
      resources :clients
      resources :orders
      resources :products
    end
  end
end
