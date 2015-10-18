class RoutingStep < ActiveRecord::Base
  belongs_to :next_step, class_name: 'RoutingStep'
  belongs_to :routing_list, inverse_of: :routing_steps

  has_many :load_orders, class_name: 'Order', foreign_key: 'load_step_id', dependent: :nullify
  has_many :unload_orders, class_name: 'Order', foreign_key: 'unload_step_id', dependent: :nullify

  attr_accessor :address, :volume

  def routing_address
    if (load_orders.any?)
      return load_orders.first.origin_address.name
    end
    unload_orders.first.destination_address.name
  end
end
