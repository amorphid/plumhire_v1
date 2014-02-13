require "spec_helper"

feature "Signing up" do
  background { visit new_sign_up_path }

  context "with email" do
    given(:email) { Faker::Internet.email }

    scenario "displays success message" do
      body    = page.body
      message = "Confirmation email sent to " + email
      expect(body).to have_content(message)
    end

    scenario "creates a SignUp"
  end

  context "without email" do
    scenario "displays error message"
  end
end
