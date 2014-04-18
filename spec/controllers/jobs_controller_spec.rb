require "spec_helper"

describe JobsController do
  context "#new" do
    it "sets @j" do
      get :new
      expect(assigns[:j]).to be_instance_of(Job)
    end
  end

  context "#update" do
    it "sets @j" do
      j = Fabricate.build(:job)
      put(
        :update,
        job: j.attributes,
        id:  j.uuid
      )
      expect(assigns[:j]).to be_instance_of(Job)
    end
  end
end
