require "spec_helper"

describe SignUp do
  let(:new_sign_up) { SignUp.new          }
  let(:sign_up)     { Fabricate(:sign_up) }

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:uuid)  }

  it do
    sign_up
    should validate_uniqueness_of(:uuid)
  end
end
