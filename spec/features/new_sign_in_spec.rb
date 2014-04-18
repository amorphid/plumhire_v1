require "spec_helper"

feature "Signing in" do
  given(:bad_email) { "bob@example.com" }
  given(:user)      { Fabricate(:user, email: "susie@example.com") }


  background { visit new_sign_in_path }

  scenario "displays error message(s) w/ invalid email & invalid password" do
    fill_in(
      "user_email",
      with: bad_email
    )
    fill_in(
      "user_password",
      with: "1234567"
    )
    click_button("Submit")
    expect(page.body).to have_content(
      "That's the wrong password for \"#{bad_email}\""
    )
  end

  scenario "displays error message(s) w/ wrong email" do
    fill_in(
      "user_email",
      with: bad_email
    )
    click_button("Submit")
    expect(page.body).to have_content(
      "\"#{bad_email}\" doesn't belong to any account, but you can "
    )
    click_link("sign up here")
    expect(current_path).to eq(new_sign_up_email_path)
  end

  scenario "displays error message(s) w/ no email" do
    click_button("Submit")
    expect(page.body).to have_content("Email can't be blank")
    expect(page.body).to have_content("Password can't be blank")
    expect(page.body).to have_content(
      "Password is too short (minimum is 8 characters)"
    )
  end
end
