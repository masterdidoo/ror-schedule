class Order < ActiveRecord::Base
  enum delivery_shift: [:morning, :afternoon, :evening]
  belongs_to :origin_point, class_name: 'Point'
  belongs_to :destination_point, class_name: 'Point'
  belongs_to :load_step, class_name: 'RoutingStep'
  belongs_to :unload_step, class_name: 'RoutingStep'
end
