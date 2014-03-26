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

    it "sets @user" do
      s = Fabricate(:sign_up)
      put(
        :update,
        sign_up: s.attributes,
        id:      s.uuid
      )
      expect(assigns[:user]).to be_instance_of(User)
    end

    it "creates a user" do
      count = User.count
      sign_up = Fabricate(:sign_up)
      put(
        :update,
        sign_up:  sign_up.attributes,
        id:       sign_up.uuid,
        password: "password"
      )
      expect(User.count).to eq(count + 1)
    end

    it "updates a user" do
      sign_up = Fabricate(:sign_up)
      Fabricate(:user, email: sign_up.email)
      count = User.count
      put(
        :update,
        sign_up:  sign_up.attributes,
        id:       sign_up.uuid,
        password: "password"
      )
      expect(User.count).to eq(count)
    end

    it "redirects" do
      sign_up = Fabricate(:sign_up)
      put(
        :update,
        sign_up:  sign_up.attributes,
        id:       sign_up.uuid,
        password: "password"
      )
      expect(response).to redirect_to(user_home_page_path(User.last))
    end
  end
end
