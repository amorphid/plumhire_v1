require "spec_helper"

describe SignUp do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:uuid) }

  it do
    Fabricate(:sign_up)
    should validate_uniqueness_of(:uuid)
  end

  context "#set_uuid" do
    it "creates Uuid on creation" do
      uuid    = SignUp.new.uuid
      pattern = Sro::Uuid.pattern
      expect(uuid).to match(pattern)
    end
  end
end
