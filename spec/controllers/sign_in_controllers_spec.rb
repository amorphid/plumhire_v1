require "spec_helper"

describe SignInsController do
  context "#new" do
    it "sets @u" do
      get(:new)
      expect(assigns[:u]).to be_instance_of(User)
    end
  end

  context "#update" do
    it "sets @u" do
      u = Fabricate(:user)
      put(
        :update,
        user: u.attributes,
        id:   u.uuid
      )
      expect(assigns[:u]).to be_instance_of(User)
    end

    it "redirects" do
      u = Fabricate(:user)
      put(
        :update,
        user: u.attributes,
        id:   u.uuid
      )
      expect(assigns[:u]).to be_instance_of(User)
    end
  end
end
