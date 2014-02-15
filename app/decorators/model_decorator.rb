class ModelDecorator
  attr_reader :model

  def initialize(model)
    @model = model
  end

  def override_to_param_method
    to_param = "def to_param; \"uuid\"; end"
    model.class.module_eval(to_param)
  end

  def response
    override_to_param_method
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
