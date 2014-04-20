require "spec_helper"

describe SignInsController do
  context "#new" do
    it "sets @u" do
      get(:new)
      expect(assigns[:u]).to be_instance_of(User)
    end
  end

  context "#update" do
    it "sets @u w/ valid input" do
      u = Fabricate(
        :user,
        password: "12345678",
        password_confirmation: "12345678"
      )
      put(
        :update,
        user: {
          email:    u.email,
          password: "12345678"
        },
        id:   u.uuid
      )
      expect(assigns[:u]).to be_instance_of(User)
    end

    it "redirects w/ invalid input" do
      put(:update)
      expect(response).to redirect_to(new_sign_in_path)
    end
  end
end
