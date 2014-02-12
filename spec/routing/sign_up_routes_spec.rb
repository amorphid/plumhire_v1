require "spec_helper"

describe "/sign_ups/new" do
  it "routes to SignUpsController#new" do
    expect(get: "/sign_ups/new").to route_to( controller: "sign_ups",
                                              action: "new" )
  end
end
