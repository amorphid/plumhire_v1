require "spec_helper"

describe "Route" do
  context "sign_ups_path" do
    it "routes to SignUpsController#index" do
      expect(get: "/sign_ups").to route_to(
        controller: "sign_ups",
        action: "index"
      )
    end
  end
end
