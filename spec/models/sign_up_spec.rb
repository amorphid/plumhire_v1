require "spec_helper"

describe SignUp do
  let(:new_sign_up) { SignUp.new          }
  let(:pattern)     { Sro::Uuid.pattern   }
  let(:sign_up)     { Fabricate(:sign_up) }

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:uuid)  }

  it do
    sign_up
    should validate_uniqueness_of(:uuid)
  end

  context "#set_uuid" do
    it "creates UUID for new SignUp" do
      uuid    = new_sign_up.uuid
      expect(uuid).to match(pattern)
    end

    it "does not alter existing Uuid" do
      uuid1 = new_sign_up.uuid
      uuid2 = new_sign_up.set_uuid
      expect(uuid1).to eq(uuid2)
    end
  end

  context "#to_param" do
    it "returns a valid UUID" do
      to_param = sign_up.to_param
      expect(to_param).to match(pattern)
    end
  end
end
