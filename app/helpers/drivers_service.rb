class DriversService
  def self.get_available(delivery_date, delivery_shift)
    delivery_shift_id = RoutingList.delivery_shifts[delivery_shift]
    schedule = get_driver_schedule(delivery_date, delivery_shift_id)
    Driver.where(schedule: schedule).reject do |d|
      d.routing_lists
          .exists?(delivery_date: delivery_date, delivery_shift: delivery_shift_id)
    end
  end

  def self.get_driver_schedule(date, delivery_shift_id)
    ((date - Driver::SCHEDULE_START_DATE).to_i + (delivery_shift_id == Order.delivery_shifts[:afternoon] ? 1 : 0)) % 2
  end
end