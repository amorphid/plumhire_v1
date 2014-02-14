require "spec_helper"

describe ModelDecorator do
  let(:model) do
    class Model < ActiveRecord::Base
      attr_accessor :uuid
    end
  end

  let(:version_5_uuid) do
    /([a-z]|\d){8}-([a-z]|\d){4}-([a-z]|\d){4}-([a-z]|\d){4}-([a-z]|\d){12}/
  end

  subject { ModelDecorator.new(model).response }

  context "#uuid" do
    it "adds a Version 5 (SHA-1 hash) UUID" do
      uuid = subject.uuid
      expect(uuid).to match(version_5_uuid)
    end
  end
end
