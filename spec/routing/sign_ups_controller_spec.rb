require "spec_helper"

describe SignUpsController do
  context "GET" do
    it do
      should route(:get, "/sign_ups/submit_email").to(
        controller: "sign_ups",
        action:     "submit_email"
      )
    end

    it do
      should route(:get, "/sign_ups/:id/email_sent").to(
        controller: "sign_ups",
        id:         ":id",
        action:     "email_sent"
      )
    end

    it do
      should route(:get, "/sign_ups/:id/set_password").to(
        controller: "sign_ups",
        id:         ":id",
        action:     "set_password"
      )
    end
  end

  context "PUT" do
    it do
      should route(:put, "/sign_ups/:id").to(
        controller: "sign_ups",
        id:         ":id",
        action:     "update"
      )
    end
  end
end
