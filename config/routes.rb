Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults:{format: :json} do
    resources :tickets, only: [:create]
  end

  resources :tickets, only: [:index, :show]
end
