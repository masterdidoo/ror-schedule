class RoutingStep < ActiveRecord::Base
  belongs_to :next_step, class_name: 'RoutingStep'
end
