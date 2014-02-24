class ApplicationModel < ActiveRecord::Base
  self.abstract_class = true

  after_initialize :set_uuid

  def set_uuid
    self.uuid ||= Sro::Uuid.version5
  end

  def to_param
    uuid
  end
end
