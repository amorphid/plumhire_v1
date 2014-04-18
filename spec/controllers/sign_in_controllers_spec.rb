require "spec_helper"

describe SignInsController do
  context "#new" do
    it "sets @u" do
      get :new
      expect(assigns[:u]).to be_instance_of(User)
    end
  end
end
