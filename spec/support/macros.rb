def signed_in_user
  user = Fabricate(:user)
  visit new_sign_in_path
  fill_in(
    "user_email",
    with: user.email
  )
  fill_in(
    "user_password",
    with: user.password
  )
  click_button "Submit"
  user
end

