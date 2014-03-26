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

  resources(
    :user_home_pages,
    only: :show
  )
end
