class SignUp < ActiveRecord::Base
  after_initialize :set_uuid

  validates :email,
            presence: true,
            uniqueness: true

  validates :uuid, presence: true, uniqueness: true

  def set_uuid
    self.uuid ||= Sro::Uuid.version5
  end
end
