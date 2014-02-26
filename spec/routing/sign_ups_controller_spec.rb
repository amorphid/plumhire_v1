require "spec_helper"

describe SignUpsController do
  it do
    should route(:get, "/sign_ups/new").to(
      controller: "sign_ups",
      action: "new"
    )
  end

  it do
    should route(:get, "/sign_ups/:id").to(
      controller: "sign_ups",
      action: "show",
      id:     ":id"
    )
  end

  it do
    should route(:put, "/sign_ups/:id").to(
      controller: "sign_ups",
      id:         ":id",
      action:     "update"
    )
  end
end
