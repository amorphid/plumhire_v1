require "spec_helper"

describe Version5UuidSetter do
  subject do
    SomeObject = Struct.new(:uuid)
    SomeObject.new
  end

  before { Version5UuidSetter.new(subject) }

  it "sets SomeObject#uuid to Version 5 UUID" do
    uuid                   = subject.uuid
    version_5_uuid_pattern =
      /([a-z]|\d){8}-([a-z]|\d){4}-([a-z]|\d){4}-([a-z]|\d){4}-([a-z]|\d){12}/
    expect(uuid).to match(version_5_uuid_pattern)
  end
end
