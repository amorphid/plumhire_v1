require "spec_helper"

describe JobsController do
  before { sign_in }

  context "#new" do
    it "sets @j" do
      get :new
      expect(assigns[:j]).to be_instance_of(Job)
    end

    it_behaves_like "require_sign_in" do
      let(:action) { get :new }
    end
  end

  context "#show" do
    let(:j) { Fabricate(:job) }

    it "sets @j" do
      get(
        :show,
        job: j.attributes,
        id:  j.uuid
      )
      expect(assigns[:j]).to eq(j)
    end
  end

  context "#update" do
    let(:j) { Fabricate.build(:job) }

    it "sets @j" do
      put(
        :update,
        job: j.attributes,
        id:  j.uuid
      )
      expect(assigns[:j]).to be_instance_of(Job)
    end

    it "redirect" do
      put(
        :update,
        job: j.attributes,
        id:  j.uuid
      )
      expect(response).to redirect_to(job_path(j))
    end

    it "creates 1 job w/ 1 put request" do
      count = Job.count
      put(
        :update,
        job: j.attributes,
        id:  j.uuid
      )
      expect(Job.count).to eq(count + 1)
    end

    it "creates 1 job w/ 2 put requests" do
      count = Job.count
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

    it_behaves_like "require_sign_in" do
      let(:action) { put :update, id: j.uuid }
    end
  end
end
