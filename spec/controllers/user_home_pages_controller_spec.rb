require "spec_helper"

describe UserHomePagesController do
  context "#show" do
    it "sets @user if signed in" do
      # u = Fabricate(:user)
      # get(
      #   :show,
      #   id: u.uuid
      # )
      # expect(assigns[:user]).to be_instance_of(User)
    end

    it "redirect if not signed in" do
      u = Fabricate(:user)
      get(
        :show,
        id: u.uuid
      )
      expect(response).to redirect_to(sign_ins_path)
    end
  end
end
