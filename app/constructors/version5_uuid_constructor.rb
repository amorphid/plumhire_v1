class Version5UuidConstructor
  def mac_address
    UUIDTools::UUID.mac_address
  end

  def response
    uuid = UUIDTools::UUID.sha1_create(timestamp, mac_address)
    uuid.to_s
  end

  def timestamp
    uuid = UUIDTools::UUID.timestamp_create
  end
end
