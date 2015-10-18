class RoutingListsService
  def self.create(routing_list)
    drivers = DriversService.get_available(routing_list.delivery_date, routing_list.delivery_shift)
    unless drivers.any?
      routing_list.errors.add(:drivers, 'No available drivers')
      return false
    end
    routing_list.driver = drivers.first

    delivery_time = routing_list.delivery_date + 1/24/60;
    perv_step = nil;

    orders = Order.where(
        delivery_date: routing_list.delivery_date,
        delivery_shift: RoutingList.delivery_shifts[routing_list.delivery_shift],
        load_step: nil,
        unload_step: nil
    )

    # points = orders.select(:origin_point_id).distinct.map { |o| o.origin_point }
    #              .concat(orders.select(:destination_point_id).distinct.map { |o| o.destination_point })
    #              .uniq
    #
    # p points

    # Order.where(
    #     delivery_date: routing_list.delivery_date,
    #     delivery_shift: routing_list.delivery_shift,
    #     load_step: nil,
    #     unload_step: nil
    # ).each do |order|
    #   delivery_time += 1/24/60;
    #   step = RoutingStep.new(
    #       # routing_list: routing_list,
    #       delivery_time: delivery_time
    #   )
    #
    #   order.load_step = step
    #   order.unload_step = step
    #
    #   unless perv_step.nil?
    #     perv_step.next_step = step
    #     perv_step.save
    #   end
    #
    #   perv_step = step
    # end
    #
    # if perv_step.nil?
    #   routing_list.errors.add(:first_step, 'No available orders')
    #   return false
    # end
    # perv_step.save

    routing_list.save
  end
end
