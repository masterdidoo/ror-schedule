class RoutingList < ActiveRecord::Base
  enum :delivery_shift => [:morning, :afternoon, :evening]
  belongs_to :driver
  belongs_to :first_step, class_name: 'RoutingStep'

  def routing_steps
    steps = []
    step = first_step
    while (!step.nil?)
      steps << step
      step = step.next_step
    end
    steps
  end

  def make
    # DriversService.get_available(delivery_date, delivery_shift)
  end
end
