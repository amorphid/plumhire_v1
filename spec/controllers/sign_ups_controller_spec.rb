require "spec_helper"

describe SignUpsController do
  context "#new" do
    it "sets @sign_up" do
      sign_up = SignUp.new
      get :new
      assignment = assigns(:sign_up)
      expect(assignment).to eq(sign_up)
    end
  end
end
