require "spec_helper"

describe Version5UuidSetter do
  subject { Version5UuidSetter.new }

  context "#object_has_uuid?" do
    it "returns false without uuid" do
      object = NGR::ReaderWriter.new(uuid: nil)
      true_or_false = subject.object_has_uuid?(object)
      expect(true_or_false).to be_false
    end
  end
end
