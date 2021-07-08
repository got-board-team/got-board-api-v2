# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  get "tokens/neutral_force_tokens"

  get "tokens/units"

  resources :games do
    resources :power_tokens
    resources :wildling_cards do
      collection do
        patch :peek
        patch :draw
        patch :shuffle
        patch :hide
        patch :move_to_bottom
      end
    end
    resources :westeros_decks do
      collection do
        patch :reveal
        patch :shuffle
      end
    end
    resources :orders do
      collection do
        patch :bulk_update, path: "/"
      end
    end
    resources :units
    resources :garrison_tokens
    resources :neutral_force_tokens
    resources :influence_tokens, controller: :track_tokens
    resources :supply_tokens, controller: :track_tokens
    resources :victory_tokens, controller: :track_tokens
  end

  root "games#index"
end
