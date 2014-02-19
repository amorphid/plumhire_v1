require "spec_helper"

describe SignUpsController do
  context "#index" do
    it "sets @sign_up" do
      get :index
      assignment = assigns(:sign_up)
      expect(assignment).to be_instance_of(SignUp)
    end
  end

  context "#update" do
    it "sets @sign_up" do
      sign_up = Fabricate.build(:sign_up)
      put :update, id: sign_up.uuid, sign_up: sign_up.attributes
      assignment = assigns(:sign_up)
      expect(assignment).to be_instance_of(SignUp)
    end
  end
end
