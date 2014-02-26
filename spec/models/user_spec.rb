require "spec_helper"

describe User do
  #email
  it { should validate_presence_of(:email)   }
  it { should validate_uniqueness_of(:email) }

  #uuid
  it { should validate_presence_of(:uuid) }
end
