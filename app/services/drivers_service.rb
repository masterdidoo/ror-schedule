class DriversService
  def self.get_available(delivery_date, delivery_shift)
    schedule = delivery_date - DateTime.new(2000,1,1) % 2
    Driver.where(:schedule => schedule)
  end

  def self.get_driver_schedule(delivery_date, delivery_shift)
    schedule = delivery_date - DateTime.new(2000,1,1) % 2
    delivery_shift
  end
end