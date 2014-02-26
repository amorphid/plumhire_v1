require "spec_helper"

describe SignUp do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:uuid)  }

  it "validates the uniqueness of UUID" do
    s1 = Fabricate(:sign_up)
    s2 = Fabricate.build(:sign_up, uuid: s1.uuid)
    expect(s2).to have(1).errors_on(:uuid)
  end
end
