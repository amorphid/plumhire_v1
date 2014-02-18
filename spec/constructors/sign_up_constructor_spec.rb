require "spec_helper"

describe SignUpConstructor do
  subject { SignUpConstructor.new }

  context "#model_decorator" do
    it "returns an instance of ModelDecorator" do
      object   = SRO::ReaderWriter.new(uuid: nil)
      instance = subject.model_decorator(object)
      expect(instance).to be_instance_of(ModelDecorator)
    end
  end

  context "#response" do
    it "returns a SignUp instance" do
      response = subject.response
      expect(response).to be_instance_of(SignUp)
    end
  end
end
