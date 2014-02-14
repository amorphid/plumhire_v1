Plumhire::Application.routes.draw do
  resources :sign_ups, only: [:index]
end
