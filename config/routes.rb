Plumhire::Application.routes.draw do
  resources(
    :sign_up_emails,
    only: [
      :new,
      :show,
      :update
    ]
  )

  resources(
    :sign_up_passwords,
    only: [
      :edit,
      :update
    ]
  )
end
