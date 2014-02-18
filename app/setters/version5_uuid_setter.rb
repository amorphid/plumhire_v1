class Version5UuidSetter
  attr_reader :object

  def initialize(args = {})
    @object = args[:object]
  end

  def set_uuid(object = object)
  end

  def object_has_uuid?(object = object)
    object.uuid ? true : false
  end
end
