require "spec_helper"

describe SignUp do
  subject { SignUp.new }

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:uuid) }

  it do
    Fabricate(:sign_up)
    should validate_uniqueness_of(:uuid)
  end

  context "#set_uuid" do
    it "creates UUID for new SignUp" do
      uuid    = subject.uuid
      pattern = Sro::Uuid.pattern
      expect(uuid).to match(pattern)
    end

    it "does not alter existing Uuid" do
      uuid1 = subject.uuid
      uuid2 = subject.set_uuid
      expect(uuid1).to eq(uuid2)
    end
  end

  context "#to_param" do
    it "returns a valid UUID" do
      to_param = Fabricate(:sign_up).to_param
      pattern  = Sro::Uuid.pattern
      expect(to_param).to match(pattern)
    end
  end
end
