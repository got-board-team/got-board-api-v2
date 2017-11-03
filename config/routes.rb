# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  resources :games do
    resources :power_tokens
    resources :orders
    resources :units
  end

  root "games#index"
end
