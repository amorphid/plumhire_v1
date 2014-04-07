require "spec_helper"

describe SignUpEmailsController do
  it do
    should route(:get, "/sign_up_emails/new").to(
      controller: "sign_up_emails",
      action:     "new"
    )
  end

  it do
    should route(:get, "/sign_up_emails/1").to(
      controller: "sign_up_emails",
      id:         "1",
      action:     "show"
    )
  end

  it do
    should route(:put, "/sign_up_emails/1").to(
      controller: "sign_up_emails",
      id:         "1",
      action:     "update"
    )
  end
end
