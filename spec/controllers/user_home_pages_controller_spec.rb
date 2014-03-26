require "spec_helper"

describe UserHomePagesController do
  context "#show" do
    it "sets @user" do
      u = Fabricate(:user)
      get(
        :show,
        id: u.uuid
      )
      expect(assigns[:user]).to be_instance_of(User)
    end
  end
end
