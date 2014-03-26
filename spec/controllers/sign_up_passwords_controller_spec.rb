require "spec_helper"

describe SignUpPasswordsController do
  context "#edit" do
    it "sets @sign_up" do
      s = Fabricate(
        :sign_up,
        email: Faker::Internet.email
      )
      get(
        :edit,
        sign_up: s.attributes,
        id:      s.uuid
      )
      expect(assigns[:sign_up]).to be_instance_of(SignUp)
    end

    it "sets @user" do
      s = Fabricate(
        :sign_up,
        email: Faker::Internet.email
      )
      get(
        :edit,
        sign_up: s.attributes,
        id:      s.uuid
      )
      expect(assigns[:user]).to be_instance_of(User)
    end
  end

  context "#update (w/ valid input)" do
    it "sets @sign_up" do
      s = Fabricate(:sign_up)
      put(
        :update,
        sign_up: s.attributes,
        id:      s.uuid
      )
      expect(assigns[:sign_up]).to be_instance_of(SignUp)
    end

    it "sets @user"
    it "redirects"
    it "creates a user"
    it "updates a user"
  end
end
