require "spec_helper"

describe ApplicationModel do
  let(:pattern) { Sro::Uuid.pattern }

  subject { ActiveRecordModel.new }

  before { ActiveRecordModel = Class.new(ApplicationModel) }

  context "#set_uuid" do
    it "creates UUID for new SignUp" do
      uuid    = subject.uuid
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
      to_param = subject.to_param
      expect(to_param).to match(pattern)
    end
  end
end
