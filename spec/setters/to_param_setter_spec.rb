require "spec_helper"

describe ToParamSetter do
  subject do
    SomeObject  = Struct.new(:to_param)
    some_object = SomeObject.new
    ToParamSetter.new(some_object)
  end

  context "#override_to_param" do
    it "returns :to_param" do
      override = subject.override_to_param
      expect(override).to eq(:to_param)
    end
  end

  context "#to_param" do
    it "returns 'uuid'" do
      to_param = subject.to_param
      expect(to_param).to eq("uuid")
    end
  end
end
