require "spec_helper"

describe "/sign_ups" do
  it "routes to SignUpsController#index" do
    expect(get: "/sign_ups").to route_to( controller: "sign_ups",
                                              action: "index" )
  end
end
