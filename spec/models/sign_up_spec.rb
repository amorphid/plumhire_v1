require "spec_helper"

describe SignUp do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:uuid) }

  it do
    Fabricate(:sign_up)
    should validate_uniqueness_of(:uuid)
  end

  context "#set_uuid" do
    it "creates UUID for new SignUp" do
      uuid    = SignUp.new.uuid
      pattern = Sro::Uuid.pattern
      expect(uuid).to match(pattern)
    end

    it "does not alter existing Uuid" do
      sign_up = SignUp.new(uuid: Sro::Uuid.version5)
      uuid1 = sign_up.uuid
      uuid2 = sign_up.set_uuid
      expect(uuid1).to eq(uuid2)
    end
  end
end
