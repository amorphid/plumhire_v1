class ApplicationModel < ActiveRecord::Base
  self.abstract_class = true

  after_initialize :set_uuid

  validates :uuid,
            presence:   true,
            uniqueness: true

  def set_uuid
    self.uuid ||= Sro::Uuid.version5
  end

  def to_param
    uuid
  end
end
