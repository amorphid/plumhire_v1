require "spec_helper"

feature "Signing up" do
  background { visit new_sign_up_email_path }

  given(:email) { Faker::Internet.email }

  scenario "displays message" do
    fill_in "sign_up_email", with: email
    click_button("Submit")
    expect(page.body).to have_content("Hey #{email},")
  end
end
