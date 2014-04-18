Fabricator(:job) do
  body  Faker::Lorem.paragraphs.join("\n\n")
  title Faker::Lorem.sentence
end
