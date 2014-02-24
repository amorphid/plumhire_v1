class SignUp < ActiveRecord::Base
  after_initialize :set_uuid

  validates :email,
            presence: true

  validates :uuid, presence: true, uniqueness: true

  def set_uuid
    self.uuid ||= Sro::Uuid.version5
  end

  def to_param
    uuid
  end
end
