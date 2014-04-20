require "spec_helper"

feature "Signing up" do
  given(:email) { Faker::Internet.email      }
  given(:uuid)  { SignUp.find_by(email: email).uuid }
  given(:password_url) { "http://#{ENV["domain"]}/sign_up_passwords/#{uuid}/edit" }

  background do
    visit root_path
    click_link("Sign up")
  end

  scenario "displays success message w/ email" do
    fill_in "sign_up_email", with: email
    click_button("Submit")
    expect(page.body).to have_content("Please check your email")
    open_email(email)
    expect(current_email).to have_content(password_url)
    visit(password_url)
    fill_in :sign_up_password, with: "password"
    click_button("Submit")
    expect(page.body).to have_content(
      "You are now signed up & logged in :)"
    )
  end

  scenario "displays error message w/o email" do
    click_button("Submit")
    expect(page.body).to have_content("Email can't be blank")
  end

  scenario "displays error w/o password" do
    fill_in "sign_up_email", with: email
    click_button("Submit")
    expect(page.body).to have_content("Please check your email")
    open_email(email)
    expect(current_email).to have_content(password_url)
    visit(password_url)
    click_button("Submit")
    expect(page.body).to have_content("Password can't be blank")
  end
end
