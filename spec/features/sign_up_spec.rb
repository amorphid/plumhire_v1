require "spec_helper"

feature "Signing up" do
  background { visit new_sign_up_path }

  context "with email" do
    given(:email) { Faker::Internet.email }

    background do
      fill_in "sign_up_email", with: email
      click_button("Submit")
    end

    scenario "displays success message" do
      body    = page.body
      message = "Confirmation email sent to " + email
      expect(body).to have_content(message)
    end

    scenario "displays failure message" do
      body    = page.body
      expect(body).to have_content("Email can't be blank")
    end

    scenario "creates a SignUp"
  end

  context "without email" do
    scenario "displays error message"
  end
end
