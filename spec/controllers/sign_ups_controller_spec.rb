require "spec_helper"

describe SignUpsController do
  context "#index" do
    it "sets @sign_up" do
      get :index
      assignment = assigns(:sign_up)
      expect(assignment).to be_instance_of(SignUp)
    end
  end
end
