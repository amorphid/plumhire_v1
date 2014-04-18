require "spec_helper"

feature "Signing in" do
  given(:user) { Fabricate(:user) }

  background { visit new_sign_in_path }

  scenario "displays error message(s) w/ invalid input" do
    click_button("Submit")
    expect(page.body).to have_content("Email can't be blank")
    expect(page.body).to have_content("Password can't be blank")
  end
end
