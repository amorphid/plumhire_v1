require "spec_helper"

describe SignUp do
  subject { Fabricate.build(:sign_up) }

  it { should validate_presence_of(:uuid) }
end
