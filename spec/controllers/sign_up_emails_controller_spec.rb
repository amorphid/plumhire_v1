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
      get(
        :show,
        sign_up: s.attributes,
        id:      s.uuid
      )
      expect(assigns(:s)).to be_instance_of(SignUp)
    end
  end

  context "#update (w/ valid input)" do
    let(:s) { Fabricate.build(:sign_up) }

    let(:put_update) do
      put(
        :update,
        sign_up: s.attributes,
        id:      s.uuid
      )
    end

    it "sets @sign_up" do
      put_update
      expect(assigns(:s)).to be_instance_of(SignUp)
    end

    it "redirects" do
      put_update
      expect(response).to redirect_to(sign_up_email_path(s))
    end

    it "creates a SignUp w/ 1 put request" do
      count = SignUp.count
      put_update
      expect(SignUp.count).to eq(count + 1)
    end

    it "updates a SignUp w/ 2 put requests" do
      s1 = Fabricate(
        :sign_up,
        email: "a@b.c"
      )
      s2 = Fabricate.build(
        :sign_up,
        email: "1@2.3",
        uuid: s1.uuid
      )
      put(
        :update,
        sign_up: s2.attributes,
        id:      s2.uuid
      )
      expect(SignUp.find_by(uuid: s1.uuid).email).to eq("1@2.3")
    end

    it "sets #email_sent_on" do
      put_update
      expect(SignUp.find_by(uuid: s.uuid).email_sent_on).
        to be_instance_of(ActiveSupport::TimeWithZone)
    end

    it "sends 1 email w/ 1 put request" do
      put_update
      expect(ActionMailer::Base.deliveries.count).to eq(1)
    end

    it "sends 1 email w/ 2 put requests" do
      put_update
      expect(ActionMailer::Base.deliveries.count).to eq(1)
    end

    it "sends 2 emails w/ 2 put requests" do
      s1 = Fabricate.build(:sign_up)
      put(
        :update,
        sign_up: s1.attributes,
        id:      s1.uuid
      )
      s2 = SignUp.find_by(uuid: s1.uuid)
      s2.update(
        email_sent_on: s2.email_sent_on - 3
      )
      put(
        :update,
        sign_up: s1.attributes,
        id:      s1.uuid
      )
      expect(ActionMailer::Base.deliveries.count).to eq(2)
    end
  end
end
