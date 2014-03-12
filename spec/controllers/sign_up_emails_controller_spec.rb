require "spec_helper"

describe SignUpEmailsController do
  context "#new" do
    it "sets @s" do
      get :new
      expect(assigns(:s)).to be_instance_of(SignUp)
    end
  end

  context "#show" do
    it "sets @s" do
      s = Fabricate(:sign_up)
      get :show,
          sign_up: s.attributes,
          id:      s.uuid
      expect(assigns(:s)).to be_instance_of(SignUp)
    end
  end

  context "#update" do
    it "sets @sign_up" do
      s = Fabricate.build(:sign_up)
      put :update,
          sign_up: s.attributes,
          id:      s.uuid
      expect(assigns(:s)).to be_instance_of(SignUp)
    end

    it "creates a SignUp if it doesn't exist" do
      count = SignUp.count
      s     = Fabricate.build(:sign_up)
      put :update,
          sign_up: s.attributes,
          id:      s.uuid
      expect(SignUp.count).to eq(count + 1)
    end

    it "updates a SignUp if it does exist" do
      s1 = Fabricate(:sign_up, email: "a@b.c")
      s2 = Fabricate.build(:sign_up, email: "1@2.3", uuid: s1.uuid)
      put :update,
          sign_up: s2.attributes,
          id:      s2.uuid
      expect(SignUp.find_by(uuid: s1.uuid).email).to eq("1@2.3")
    end

    it "sends user an email w/ valid input if email_sent_on is blank" do
      s = Fabricate.build(:sign_up)
      put :update,
          sign_up: s.attributes,
          id:      s.uuid
      expect(ActionMailer::Base.deliveries).not_to be_empty
    end

    it "sets email_sent_on when email sent" do
      s = Fabricate.build(:sign_up, email: "a@b.c")
      put :update,
          sign_up: s.attributes,
          id:      s.uuid
      expect(SignUp.find_by(uuid: s.uuid).email_sent_on).
        to be_instance_of(ActiveSupport::TimeWithZone)
    end

    it "does not send an email if email_sent_on exists && repeat email" do
      s1 = Fabricate(:sign_up, email: "a@b.c", email_sent_on: DateTime.now)
      s2 = s1.attributes.dup
      s2["email"] = "1@2.3"
      put :update,
          sign_up: s2,
          id: s2["uuid"]
      expect(ActionMailer::Base.deliveries).to be_empty
    end

    it "sends an email if email_sent_on exists && new email" do
      s = Fabricate(:sign_up, email: "a@b.c", email_sent_on: DateTime.now)
      put :update,
          sign_up: s.attributes,
          id:      s.uuid
      expect(ActionMailer::Base.deliveries).to be_empty
    end

    it "redirects to sign_up_path(@sign_up) with valid input" do
      s = Fabricate.build(:sign_up)
      put :update,
          sign_up: s.attributes,
          id:      s.uuid
      expect(response).to redirect_to(sign_up_email_path(s))
    end
  end
end
