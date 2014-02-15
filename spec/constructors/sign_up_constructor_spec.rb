require "spec_helper"

describe SignUpConstructor do
  subject { SignUpConstructor.new }

  context "#response" do
    it "returns a SignUp instance" do
      response = subject.response
      expect(response).to be_instance_of(SignUp)
    end
  end
end
