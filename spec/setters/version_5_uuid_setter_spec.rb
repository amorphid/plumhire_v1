require "spec_helper"

describe Version5UuidSetter do
  subject do
    SomeObject  = Struct.new(:uuid)
    some_object = SomeObject.new
    Version5UuidSetter.new(some_object)
  end

  context "#uuid" do
    it "returns a Version 5 UUID" do
      uuid = subject.uuid

      version_5_uuid_pattern =
        /([a-z]|\d){8}-([a-z]|\d){4}-([a-z]|\d){4}-([a-z]|\d){4}-([a-z]|\d){12}/

      expect(uuid).to match(version_5_uuid_pattern)
    end
  end
end
