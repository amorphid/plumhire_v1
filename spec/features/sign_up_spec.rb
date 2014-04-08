require "spec_helper"

feature "Signing up" do
  given(:email) { Faker::Internet.email }

  background do
    visit root_path
    click_link("Sign up")
  end

  scenario "displays message w/ valid input" do
    fill_in "sign_up_email", with: email
    click_button("Submit")
    expect(page.body).to have_content("Hey #{email},")
    open_email(email)
    current_email.click_link("click here")
    fill_in :sign_up_password, with: "password"
    click_button("Submit")
    expect(page.body).to have_content(
      "Sign Up successful, and you're now logged in, too!"
    )
  end

  scenario "displays error w/o email" do
    click_button("Submit")
    expect(page.body).to have_content("Email can't be blank")
  end

  scenario "displays error w/o password" do
    fill_in "sign_up_email", with: email
    click_button("Submit")
    expect(page.body).to have_content("Hey #{email},")
    open_email(email)
    current_email.click_link("click here")
    click_button("Submit")
    expect(page.body).to have_content("Password can't be blank")
  end
end
