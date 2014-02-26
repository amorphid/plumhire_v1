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

    it "creates a User if SignUp has no User" do
      count1 = User.count
      sign_up = Fabricate.biuld(:sign_up)
      put :update, sign_up: sign_up.attributes, id: sign_up.uuid
      count2 = User.count
      expect(count2).to eq(count1 + 1)
    end

    it "sends user an email w/ valid input if email_sent_on is blank" do
      sign_up = Fabricate.build(:sign_up)
      put :update, id: sign_up.uuid, sign_up: sign_up.attributes
      expect(ActionMailer::Base.deliveries).not_to be_empty
    end

    it "sets email_sent_on when email sent" do
      sign_up       = Fabricate.build(:sign_up)
      put :update, id: sign_up.uuid, sign_up: sign_up.attributes
      email_sent_on = SignUp.find_by(uuid: sign_up.uuid).email_sent_on
      expect(email_sent_on).to be_instance_of(ActiveSupport::TimeWithZone)
    end

    it "does not send an email if email_sent_on exists" do
      sign_up = Fabricate(:sign_up, email_sent_on: DateTime.now)
      put :update, id: sign_up.uuid, sign_up: sign_up.attributes
      expect(ActionMailer::Base.deliveries).to be_empty
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
