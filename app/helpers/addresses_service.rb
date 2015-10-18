class AddressesService
  def self.get_distance(start_address, stop_address)
    (start_address == stop_address) ? 0 : 1
  end
  def self.get_delivery_time(start_address, stop_address)
    (start_address == stop_address) ? 0 : 1.minutes
  end
end
