require "spec_helper"

describe SignUpPasswordsController do
  it do
    should route(:get, "/sign_up_passwords/1/edit").to(
      controller: "sign_up_passwords",
      id:         "1",
      action:     "edit"
    )
  end

  it do
    should route(:put, "/sign_up_passwords/1").to(
      controller: "sign_up_passwords",
      id:         "1",
      action:     "update"
    )
  end
end
