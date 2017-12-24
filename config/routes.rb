# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  get "tokens/neutral_force_tokens"

  get "tokens/units"

  resources :games do
    resources :power_tokens
    resources :orders do
      collection do
        patch :bulk_update, path: "/"
      end
    end
    resources :units
    resources :garrison_tokens
    resources :influence_tokens
    resources :neutral_force_tokens
  end

  root "games#index"
end
