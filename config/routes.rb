Plumhire::Application.routes.draw do
  resources :sign_ups, only: [:update] do
    collection { get "submit_email" }

    member do
      get "email_sent"
      get "set_password"
    end
  end
end
