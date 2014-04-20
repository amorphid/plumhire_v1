require "spec_helper"

describe JobsController do
  before { sign_in }

  context "#new" do
    let(:get_new) { get :new }

    it "sets @j" do
      get_new
      expect(assigns[:j]).to be_instance_of(Job)
    end

    it_behaves_like "require_sign_in" do
      let(:action) { get_new }
    end
  end

  context "#show" do
    let(:get_show) do
      get(
        :show,
        job: job.attributes,
        id:  job.uuid
      )
    end

    let(:job) { Fabricate(:job) }

    it "sets @j" do
      get_show
      expect(assigns[:j]).to eq(job)
    end

    it_behaves_like "require_sign_in" do
      let(:action) { get_show }
    end
  end

  context "#update" do
    let(:j) { Fabricate.build(:job) }

    let(:put_update) do
      put(
        :update,
        job: j.attributes,
        id:  j.uuid
      )
    end

    it "sets @j" do
      put_update
      expect(assigns[:j]).to be_instance_of(Job)
    end

    it "redirect" do
      put_update
      expect(response).to redirect_to(job_path(j))
    end

    it "creates 1 job w/ 1 put request" do
      count = Job.count
      put_update
      expect(Job.count).to eq(count + 1)
    end

    it "creates 1 job w/ 2 put requests" do
      count = Job.count
      put_update
      put_update
      expect(Job.count).to eq(count + 1)
    end

    it_behaves_like "require_sign_in" do
      let(:action) { put :update, id: j.uuid }
    end
  end
end
