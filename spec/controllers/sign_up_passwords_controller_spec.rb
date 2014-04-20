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
  end

  context "#update" do
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
      sign_up_attr = sign_up.attributes
      sign_up_attr["password"] = "password"
      put(
        :update,
        sign_up:  sign_up_attr,
        id:       sign_up_attr["uuid"]
      )
      expect(User.count).to eq(count + 1)
    end

    it "updates a user" do
      user1 = Fabricate(
        :user,
        password:              "password1",
        password_confirmation: "password1"
      )
      sign_up = Fabricate(:sign_up)
      sign_up_attr = sign_up.attributes
      sign_up_attr["password"] = "password2"
      put(
        :update,
        sign_up:  sign_up_attr,
        id:       sign_up_attr["uuid"]
      )
      user2 = assigns[:user].authenticate("password2")
      expect(user2).to be_instance_of(User)
    end

    it "redirects" do
      sign_up = Fabricate(:sign_up)
      sign_up_attr = sign_up.attributes
      sign_up_attr["password"] = "password"
      put(
        :update,
        sign_up:  sign_up_attr,
        id:       sign_up_attr["uuid"]
      )
      expect(response).to redirect_to(
        user_home_page_path(User.find_by(email: sign_up.email))
      )
    end
  end
end
