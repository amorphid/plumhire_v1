require "spec_helper"

describe ModelDecorator do
  let(:model)           { Struct.new("Model", :uuid) }
  let(:model_decorator) { ModelDecorator.new(model.new) }
  let(:response)        { model_decorator.response }

  let(:version_5_uuid) do
    /([a-z]|\d){8}-([a-z]|\d){4}-([a-z]|\d){4}-([a-z]|\d){4}-([a-z]|\d){12}/
  end

  context "#response" do
    it "returns model with uuid" do
      uuid = response.uuid
      expect(uuid).to match(version_5_uuid)
    end

    it "overrides models to_param method" do
      model_decorator.override_to_param_method
      response  = model_decorator.response
      to_param  = response.to_param
      expect(to_param).to eq("uuid")
    end
  end

  context "#uuid" do
    it "generates a Version 5 (SHA-1 hash) UUID" do
      uuid = model_decorator.uuid
      expect(uuid).to match(version_5_uuid)
    end
  end
end
