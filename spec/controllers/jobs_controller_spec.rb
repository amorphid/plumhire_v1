require "spec_helper"

describe JobsController do
  context "#new" do
    it "sets @j" do
      get :new
      expect(assigns[:j]).to be_instance_of(Job)
    end
  end
end
