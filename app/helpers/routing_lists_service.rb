class RoutingListsService
  def self.create(routing_list)
    drivers = DriversService.get_available(routing_list.delivery_date, routing_list.delivery_shift)
    unless drivers.any?
      routing_list.errors.add(:drivers, 'No available drivers')
      return false
    end
    routing_list.driver = drivers.first
    routing_list.save
  end
end
