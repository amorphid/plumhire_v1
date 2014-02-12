require "spec_helper"

describe SignUpsController do
  subject { Fabricate(:sign_up) }

  context "#new" do
    it "sets @sign_up" do
      sign_up = subject
      get :new
      assignment = assigns(:sign_up)
      expect(assignment).to eq(sign_up)
    end
  end
end
