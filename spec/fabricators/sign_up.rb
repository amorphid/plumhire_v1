Fabricator(:sign_up) do
  email Faker::Internet.email
  uuid SRO::Uuid.version5
end
