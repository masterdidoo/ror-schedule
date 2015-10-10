class RoutingList < ActiveRecord::Base
  belongs_to :driver
  belongs_to :first_step, class_name: 'RoutingStep'
end
