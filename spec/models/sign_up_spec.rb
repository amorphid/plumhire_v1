require "spec_helper"

describe SignUp do
  subject { Fabricate(:sign_up) }

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:uuid) }

  it do
    subject
    should validate_uniqueness_of(:uuid)
  end

  context "#set_uuid" do
    it "should be a valid UUID" do
      uuid    = subject.uuid
      pattern = Sro::Uuid.pattern
      expect(uuid).to match(pattern)
    end
  end
end
