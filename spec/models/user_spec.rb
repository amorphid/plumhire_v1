require "spec_helper"

describe User do
  it { should validate_presence_of(:email)   }
  it { should validate_uniqueness_of(:email) }

  it { should have_many(:sign_ups) }

  it { should validate_presence_of(:password) }

  it { should validate_presence_of(:password_confitmation) }
end
