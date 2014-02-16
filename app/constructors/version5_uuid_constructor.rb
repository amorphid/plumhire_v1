class Version5UuidConstructor
  def mac_address
    UUIDTools::UUID.mac_address
  end

  def response
    # this generates a UUID, not it's not Version 5
    # Version 5 uses a SHA-1 encryption hash
    UUIDTools::UUID.timestamp_create.to_s
  end

  def timestamp
    uuid = UUIDTools::UUID.timestamp_create
    uuid.to_s
  end
end
