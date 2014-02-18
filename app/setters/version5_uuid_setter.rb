class Version5UuidSetter
  attr_reader :object

  def initialize(args = {})
    @object = args[:object]
  end

  def object_has_uuid?(object = object)
    false
  end
end
