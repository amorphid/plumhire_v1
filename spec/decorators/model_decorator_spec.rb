require "spec_helper"

describe ModelDecorator do
  subject { ModelDecorator.new }

  context "#to_param_injector" do
    it "returns an instance of ToParamInjector" do
      model    = SRO::ReaderWriter.new
      instance = subject.to_param_injector(model)
      expect(instance).to be_instance_of(ToParamInjector)
    end
  end

  context "#version5_uuid_setter" do
    it "returns an instance of Version5UuidSetter" do
      model    = SRO::ReaderWriter.new(uuid: nil)
      instance = subject.version5_uuid_setter(model)
      expect(instance).to be_instance_of(Version5UuidSetter)
    end
  end
end
