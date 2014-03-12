require "spec_helper"

feature "Signing up" do
  background { visit new_sign_up_email_path }

  context "with email" do
    given(:email) { Faker::Internet.email }

    scenario "displays success message" do
      fill_in "sign_up_email", with: email
      click_button("Submit")
      body    = page.body
      message = "Confirmation email sent to " + email
      expect(body).to have_content(message)
    end
  end

  context "without email" do
    scenario "displays failure message" do
      click_button("Submit")
      body    = page.body
      expect(body).to have_content("Email can't be blank")
    end
  end
end
