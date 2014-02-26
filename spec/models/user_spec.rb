require "spec_helper"

describe User do
    it { should validate_presence_of(:email)   }
    it { should validate_uniqueness_of(:email) }

    it { should validate_presence_of(:uuid)    }

    it "should validate uniqueness of UUID" do
      u1 = Fabricate(:user)
      u2 = Fabricate.build(:user, uuid: u1.uuid)
      expect(u2).to have(1).errors_on(:uuid)
    end
  end
end
