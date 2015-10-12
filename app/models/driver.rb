class Driver < ActiveRecord::Base
  belongs_to :truck

  def get_available_schedules(date)
    s = (date - DateTime.new(2000,1,1)) % 2
    s == schedule ? [:morning, :evening] : [:afternoon]
  end


  # service

  def self.get_driver_schedule(date, delivery_schedule)
    ((date - DateTime.new(2000,1,1)).to_i + (delivery_schedule == :afternoon ? 1 : 0)) % 2
  end
end
