require "spec_helper"

describe Version5UuidConstructor do
  subject { Version5UuidConstructor.new }

  context "#mac_address" do
    it "retrieves computers mac address" do
      mac_address = subject.mac_address
      pattern     = /((\d|[a-f]){2}:){5}(\d|[a-f]){2}/
      expect(mac_address).to match(pattern)
    end
  end

  context "#response" do
    it "generates a Version 5 UUID" do
      uuid = subject.response
      pattern = SRO::Uuid.pattern
      expect(uuid).to match(pattern)
    end
  end

  context "#timestamp" do
    it "returns a UUIDTools::UUID object" do
      object    = subject.timestamp
      obj_class = object.class
      expect(obj_class).to eq(UUIDTools::UUID)
    end
  end
end
