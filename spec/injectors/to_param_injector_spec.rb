require "spec_helper"

describe ToParamInjector do
  subject { ToParamInjector.new }

  context "#inject_to_param" do
    it "overrides to_param method" do
      object   = SRO::ReaderWriter.new(to_param: "not uuid")
      subject.inject_to_param(object)
      to_param = object.to_param
      expect(to_param).to eq("uuid")
    end
  end
end
