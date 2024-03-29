require "spec_helper"

describe SignInsController do
  context "#new" do
    it "sets @u" do
      get(:new)
      expect(assigns[:u]).to be_instance_of(User)
    end
  end

  context "#update" do
    let(:u) do
      Fabricate(
        :user,
        password: "12345678",
        password_confirmation: "12345678"
      )
    end

    let(:put_update) do
      put(
        :update,
        user: {
          email:    u.email,
          password: "12345678"
        },
        id: Sro::Uuid.version5
      )
    end

    it "sets @u" do
      put_update
      expect(assigns[:u]).to be_instance_of(User)
    end

    it "redirects" do
      put_update
      expect(response).to redirect_to(user_home_page_path(u))
    end
  end
end
