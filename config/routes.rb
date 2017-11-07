# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  get 'tokens/neutral_force_tokens'

  get 'tokens/units'

  resources :games do
    resources :power_tokens
    resources :orders
    resources :units
    resources :garrison_tokens
    resources :neutral_force_tokens
    resources :tokens
  end

  root "games#index"
end
