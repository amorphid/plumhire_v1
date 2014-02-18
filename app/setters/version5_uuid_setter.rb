class Version5UuidSetter
  attr_reader :object

  def initialize(args = {})
    @object = args[:object]

    unless object.blank?
      set_uuid
    end
  end

  def set_uuid(object = object)
    unless object.uuid
      constructor = Version5UuidConstructor.new
      uuid        = constructor.response
      object.uuid = uuid
    end
  end
end
