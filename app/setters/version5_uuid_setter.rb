class Version5UuidSetter
  attr_reader :object

  def initialize(object)
    @object     = object
    object.uuid = uuid
  end

  def uuid
    timestamp   = UUIDTools::UUID.timestamp_create
    mac_address = UUIDTools::UUID.mac_address
    uuid        = UUIDTools::UUID.sha1_create(timestamp, mac_address)
    uuid.to_s
  end
end
