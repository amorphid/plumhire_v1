Plumhire::Application.routes.draw do

  root to: "front_pages#index"

  resources(
    :jobs,
    only: [
      :new,
      :show,
      :update
    ]
  )

  resources(
    :sign_up_emails,
    only: [
      :new,
      :show,
      :update
    ]
  )

  resources(
    :sign_ins,
    only: [
      :new,
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
