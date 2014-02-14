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

  context "create_or_update_sign_up_path" do
    it "routes to SignUpsController#create_or_update" do
      expect(put: "/sign_ups/:id/create_or_update").to route_to(
        controller: "sign_ups",
        id:         ":id",
        action:     "create_or_update"
      )
    end
  end
end
