require "spec_helper"

describe SignUp do
  subject { Fabricate.build(:sign_up) }

  context "validates presence of" do
    it "email" do
      expect(subject).to have(0).errors_on(:email)
      subject.first_name = nil
      expect(subject).to have(1).errors_on(:email)
    end
  end
end
