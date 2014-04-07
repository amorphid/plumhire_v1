require "spec_helper"

describe User do
  subject { User.new }

  context "#email" do
    it { should validate_presence_of(:email) }

    it do
      Fabricate(:user)
      should validate_uniqueness_of(:email)
    end
  end

  context "#password" do
    it { should ensure_length_of(:password).is_at_least(8) }
  end
end
