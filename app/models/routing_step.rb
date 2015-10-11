class RoutingStep < ActiveRecord::Base
  belongs_to :next_step, class_name: 'RoutingStep'
  # belongs_to :routing_list

  has_many :load_orders, class_name: 'Order', foreign_key: 'load_step_id'
  has_many :unload_orders, class_name: 'Order', foreign_key: 'unload_step_id'
end
