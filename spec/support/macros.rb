def clear_current_user
  session[:user_id] = nil
end

def sign_in(user = Fabricate(:user))
  begin
    session[:user_id] = user.id
  rescue
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
  end
end

def signed_in_user
  user = Fabricate(:user)
  sign_in(user)
  user
end
