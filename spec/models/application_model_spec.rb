require "spec_helper"

describe ApplicationModel do
  let(:pattern) { Sro::Uuid.pattern }

  subject { Fabricate.build(:active_record_model) }

  it { should validate_presence_of(:uuid) }

  it "validates the uniqueness of UUID" do
    a1 = Fabricate(:active_record_model)
    a2 = Fabricate.build(:active_record_model, uuid: a1.uuid)
    expect(a2).to have(1).errors_on(:uuid)
  end

  context "#set_uuid" do
    it "creates UUID for new SignUp" do
      uuid    = subject.uuid
      expect(uuid).to match(pattern)
    end

    it "does not alter existing UUID" do
      uuid1 = subject.uuid
      uuid2 = subject.set_uuid
      expect(uuid1).to eq(uuid2)
    end
  end

  context "#to_param" do
    it "returns a valid UUID" do
      to_param = subject.to_param
      expect(to_param).to match(pattern)
    end
  end
end
