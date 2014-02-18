class Version5UuidSetter
  attr_reader :object

  def initialize(args = {})
    @object = args[:object]
  end

  def set_uuid(object = object)
    unless object_has_uuid?(object)
      constructor = Version5UuidConstructor.new
      uuid        = constructor.response
      object.uuid = uuid
    end
  end

  def object_has_uuid?(object = object)
    object.uuid ? true : false
  end
end
