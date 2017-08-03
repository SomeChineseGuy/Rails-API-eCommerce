
# require 'api_constraints'

# Store::Application.routes.draw do
#   namespace :api, defaults: {format: 'json'} do
#     scope module: :v1, constraints: ApiConstraints.new(version: 1) do
#       resources :products
#     end
#     scope module: :v2, constraints: ApiConstraints.new(version: 2, default: true) do
#       resources :products
#     end
#   end
  
#   resources :products
#   root to: 'products#index'
# end

Rails.application.routes.draw do
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do

      end
  end

  resources :products
  resources :categories
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
end
