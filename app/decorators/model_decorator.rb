class ModelDecorator
  attr_reader :model

  def initialize(model = nil)
    @model = model
  end

  def response
    model.uuid = uuid
    model
  end

  def uuid
    timestamp   = UUIDTools::UUID.timestamp_create
    mac_address = UUIDTools::UUID.mac_address
    uuid        = UUIDTools::UUID.sha1_create(timestamp, mac_address)
    uuid.to_s
  end
end
