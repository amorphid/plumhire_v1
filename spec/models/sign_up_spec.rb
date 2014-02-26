require "spec_helper"

describe SignUp do
  it { should validate_presence_of(:email) }
end
