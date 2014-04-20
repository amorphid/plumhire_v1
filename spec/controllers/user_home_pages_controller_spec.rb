require "spec_helper"

describe UserHomePagesController do
  let(:get_show) do
    get(
      :show,
      id: u.uuid
    )
  end

  let(:u) { Fabricate(:user) }

  before { session[:user_id] = u.id }

  context "#show" do
    it "sets @user if signed in" do
      get_show
      expect(assigns[:user]).to be_instance_of(User)
    end

    it_behaves_like "require_sign_in" do
      let(:action) { get_show }
    end
  end
end
