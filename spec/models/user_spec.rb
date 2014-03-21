require "spec_helper"

describe User do
  it { should validate_presence_of(:email) }
  it { should have_many(:sign_ups) }

  it do
    Fabricate(:user)
    should validate_uniqueness_of(:email)
  end

  it do
    Fabricate(:user)
    should validate_presence_of(:password)
  end

  it do
    Fabricate(:user)
    validate_presence_of(:password_confirmation)
  end
end
