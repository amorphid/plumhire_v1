Plumhire::Application.routes.draw do
  resources :sign_ups, only: [:new, :show, :update]
end
