Plumhire::Application.routes.draw do
  resources :sign_ups, only: [:index] do
    member do
      put "create_or_update"
    end
  end
end
