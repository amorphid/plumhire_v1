require "spec_helper"

feature "Signing up" do
  background { visit new_sign_up_path }

  context "with email" do
    scenario "displays success message" do
      body = page.body
      expect(body).to have_content("Sign up successful")
    end

    scenario "creates a SignUp"
  end

  context "without email" do
    scenario "displays error message"
  end
end
