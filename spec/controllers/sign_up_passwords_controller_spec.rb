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
end
