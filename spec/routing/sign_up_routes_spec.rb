require "spec_helper"

describe "SignUp route" do
  it "GET /sign_ups routes to index" do
    expect(get: "/sign_ups").to route_to(
      controller: "sign_ups",
      action: "index"
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
