Plumhire::Application.routes.draw do
  resources :sign_up_emails, only: [:new, :show, :update]
end
