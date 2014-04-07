require "spec_helper"

feature "Creating a job" do
  let(:body)  { Faker::Lorem.paragraphs }
  let(:title) { Faker::Lorem.sentence   }
  let(:user)  { Fabricate(:user)        }

  scenario "displays a success message w/ valid input" do
    visit user_home_page_path(user)
    click_link("New Job")
    fill_in "job_ad_title", with: title
    fill_in "job_ad_body",  with: body
    click_button("Submit")
    expect(page.body).to have_content("Your job ad has been created")
    expect(page.body).to have_content(title)
    expect(page.body).to have_content(body)
  end

  scenario "displays error messages w/ invalid input" do
    visit user_home_page_path(user)
    click_link("New Job")
    click_button("Submit")
    expect(page.body).to have_content("Title can't be blank")
    expect(page.body).to have_content("Body can't be blank")
  end
end