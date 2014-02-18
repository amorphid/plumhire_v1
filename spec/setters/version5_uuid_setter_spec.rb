require "spec_helper"

describe Version5UuidSetter do
  subject { Version5UuidSetter.new }

  context "#set_uuid" do
    it "sets uuid to object if object uuid is blank" do
      object   = SRO::ReaderWriter.new(uuid: nil)
      subject.set_uuid(object)
      uuid     = object.uuid
      pattern  = SRO::Uuid.pattern
      expect(uuid).to match(pattern)
    end

    it "does not set uuid if object is not blank" do
      uuid1  = Version5UuidConstructor.new.response
      object = SRO::ReaderWriter.new(uuid: uuid1)
      subject.set_uuid(object)
      uuid2  = object.uuid
      expect(uuid1).to eq(uuid2)
    end
  end
end
