class RoutingListsService
  def self.create(routing_list)
    drivers = DriversService.get_available(routing_list.delivery_date, routing_list.delivery_shift)
    unless drivers.any?
      routing_list.errors.add(:drivers, 'No available drivers')
      return false
    end
    driver = drivers.first

    orders = Order.where(
        delivery_date: routing_list.delivery_date,
        delivery_shift: RoutingList.delivery_shifts[routing_list.delivery_shift],
        load_step: nil,
        unload_step: nil
    ).map

    unless orders.any?
      routing_list.errors.add(:routing_lists, 'No orders')
      return false
    end

    start_address = driver.truck.start_address
    points = []
    orders.map { |o| o.origin_address }
        .concat(orders.map { |o| o.destination_address })
        .uniq
        .each do |address|
      point = Point.new
      point.address = address
      point.load_orders = orders.select { |o| o.origin_address_id == address.id }
      point.unload_orders = orders.select { |o| o.destination_address_id == address.id }
      point.distance = AddressesService.get_distance(start_address, address)
      points << point
    end

    steps = []

    step = RoutingStep.new
    step.delivery_time = routing_list.delivery_date + SHIFTS[routing_list.delivery_shift]
    step.address = driver.truck.start_address
    step.volume = driver.truck.volume

    begin
      step = next_step(step, points)
      steps << step unless step.nil?
    end while !step.nil?

    i = 0;
    steps.each do |s|
      i+=1
      s.routing_list = routing_list
      s.index = i
      s.save
    end

    orders.each { |o| o.save }

    routing_list.driver = driver
    routing_list.save
  end

  def self.next_step(prev_step, points)
    start_points = points.select do |p|
      p.load_orders.any? { |ord| ord.load_step.nil? } ||
          p.unload_orders.any? { |ord| ord.unload_step.nil? }
    end.map do |p|
      p.time = AddressesService.get_delivery_time(prev_step.address, p.address)
      p
    end.sort { |p| p.time }

    start_points.each do |point|
      step = RoutingStep.new
      step.address = point.address
      step.delivery_time = prev_step.delivery_time + point.time
      step.volume = prev_step.volume

      action_exists = false

      point.unload_orders.select { |ord| !ord.load_step.nil? }.each do |ord|
        ord.unload_step = step
        step.volume += ord.volume
        action_exists = true
      end
      point.load_orders.select { |ord| ord.load_step.nil? }.each do |ord|
        if step.volume >= ord.volume
          ord.load_step = step
          step.volume -= ord.volume
          action_exists = true
        end
      end

      return step if action_exists
    end
    return nil
  end

  SHIFTS = {
      'morning' => 8.hours,
      'afternoon' => 12.hours,
      'evening' => 18.hours
  }
end
