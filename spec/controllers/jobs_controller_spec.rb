require "spec_helper"

describe JobsController do
  context "#new" do
    it "sets @j" do
      get :new
      expect(assigns[:j]).to be_instance_of(Job)
    end
  end

  context "#show" do
    it "sets @j" do
      j = Fabricate(:job)
      get(
        :show,
        job: j.attributes,
        id:  j.uuid
      )
      expect(assigns[:j]).to eq(j)
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

    it "redirect" do
      j = Fabricate.build(:job)
      put(
        :update,
        job: j.attributes,
        id:  j.uuid
      )
      expect(response).to redirect_to(job_path(j))
    end

    it "creates 1 job w/ 1 put request" do
      count = Job.count
      j = Fabricate.build(:job)
      put(
        :update,
        job: j.attributes,
        id:  j.uuid
      )
      expect(Job.count).to eq(count + 1)
    end

    it "creates 1 job w/ 2 put requests" do
      count = Job.count
      j = Fabricate.build(:job)
      put(
        :update,
        job: j.attributes,
        id:  j.uuid
      )
      put(
        :update,
        job: j.attributes,
        id:  j.uuid
      )
      expect(Job.count).to eq(count + 1)
    end
  end
end
