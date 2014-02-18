require "spec_helper"

describe Version5UuidSetter do
  subject { Version5UuidSetter.new }

  context "#object_has_uuid?" do
    it "returns true with uuid" do
      uuid          = Version5UuidConstructor.new.response
      object        = SRO::ReaderWriter.new(uuid: uuid)
      true_or_false = subject.object_has_uuid?(object)
      expect(true_or_false).to eq(true)
    end

    it "returns false without uuid" do
      object        = SRO::ReaderWriter.new(uuid: nil)
      true_or_false = subject.object_has_uuid?(object)
      expect(true_or_false).to eq(false)
    end
  end
end
