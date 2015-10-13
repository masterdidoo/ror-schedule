class Driver < ActiveRecord::Base
  belongs_to :truck
  has_many :routing_lists

  SCHEDULE_START_DATE = DateTime.new(2000,1,1)

  def get_available_schedules(date)
    s = (date - SCHEDULE_START_DATE) % 2
    s == schedule ? [:morning, :evening] : [:afternoon]
  end
end
