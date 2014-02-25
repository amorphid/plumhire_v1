require "spec_helper"

describe SignUpsController do
  context "#new" do
    it "sets @sign_up" do
      get :new
      assignment = assigns(:sign_up)
      expect(assignment).to be_instance_of(SignUp)
    end
  end

  context "#show" do
    it "sets @sign_up" do
      sign_up = Fabricate(:sign_up)
      get :show, sign_up: sign_up.attributes, id: sign_up.uuid
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

    it "creates a SignUp if it doesn't exist" do
      pre_count    = SignUp.count
      sign_up      = Fabricate.build(:sign_up)
      put :update, sign_up: sign_up.attributes, id: sign_up.uuid
      post_count   = SignUp.count
      expect(post_count).to eq(pre_count + 1)
    end

    it "updates a SignUp if it does exist" do
      sign_up = Fabricate(:sign_up, email: "a@b.c")
      sign_up.email = "1@2.3"
      put :update, sign_up: sign_up.attributes, id: sign_up.uuid
      email = SignUp.find_by(uuid: sign_up.uuid).email
      expect(email).to eq("1@2.3")
    end

    it "creates error on @sign_up with invalid input" do
      sign_up = Fabricate.build(:sign_up, email: nil)
      put :update, id: sign_up.uuid, sign_up: sign_up.attributes
      assignment = assigns(:sign_up)
      expect(assignment).to have(1).errors
    end

    it "redirects to sign_up_path(@sign_up) with valid input" do
      sign_up = Fabricate.build(:sign_up)
      put :update, id: sign_up.uuid, sign_up: sign_up.attributes
      expect(response).to redirect_to(sign_up_path(sign_up))
    end
  end
end
