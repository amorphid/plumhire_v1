require "spec_helper"

describe SignUpsController do
  context "#new" do
    it "sets @sign_up" do
      get :new
      assignment = assigns(:sign_up)
      expect(assignment).to be_instance_of(SignUp)
    end
  end
end
