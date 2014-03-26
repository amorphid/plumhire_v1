require "spec_helper"

describe User do
  subject { User.new }

  it { should have_many(:sign_ups) }

  context "#email" do
    it { should validate_presence_of(:email) }

    it do
      Fabricate(:user)
      should validate_uniqueness_of(:email)
    end
  end
end
