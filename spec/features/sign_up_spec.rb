require "spec_helper"

feature "Signing up" do
  given(:email) { Faker::Internet.email }

  scenario "displays message" do
    # /sign_up_emails/new
    visit new_sign_up_email_path
    fill_in "sign_up_email", with: email
    click_button("Submit")

    # /submit_email/:id
    expect(page.body).to have_content("Hey #{email},")

    # an email
    open_email(email)
    current_email.click_link("click here")

    # /sign_up_passwords/new
    fill_in "user_password", with: "password"
    click_button("Submit")

    # /home
    expect(page.body).to have_content(
      "Sign Up successful, and you're now logged in, too!"
    )
  end
end
