class RoutingList < ActiveRecord::Base
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
end
