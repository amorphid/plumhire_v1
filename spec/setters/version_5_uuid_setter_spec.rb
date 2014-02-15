require "spec_helper"

describe Version5UuidSetter do
  let(:version_5_uuid_pattern) do
    /([a-z]|\d){8}-([a-z]|\d){4}-([a-z]|\d){4}-([a-z]|\d){4}-([a-z]|\d){12}/
  end

  subject do
    SomeObject  = Struct.new(:uuid)
    some_object = SomeObject.new
    Version5UuidSetter.new(some_object)
  end

  context "#object" do
    it "returns an object with a Version 5 UUID" do
      object = subject.object
      uuid   = object.uuid
      expect(uuid).to match(version_5_uuid_pattern)
    end
  end

  context "#uuid" do
    it "returns a Version 5 UUID" do
      uuid = subject.uuid
      expect(uuid).to match(version_5_uuid_pattern)
    end
  end
end
