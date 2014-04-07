class Job < ApplicationModel
  validates(
    :body,
    presence: true
  )

  validates(
    :title,
    presence: true
  )
end
