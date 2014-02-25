require "spec_helper"

describe "SignUp route" do
  it "GET /sign_ups/new routes to new" do
    expect(get: "/sign_ups/new").to route_to(
      controller: "sign_ups",
      action: "new"
    )
  end

  it "GET /sign_ups/:id routes to show" do
    expect(get: "/sign_ups/:id").to route_to(
      controller: "sign_ups",
      action: "show",
      id:     ":id"
    )
  end

  it "PUT /sign_ups:/id routes to update" do
    expect(put: "/sign_ups/:id").to route_to(
      controller: "sign_ups",
      id:         ":id",
      action:     "update"
    )
  end
end
