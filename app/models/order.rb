class Order < ActiveRecord::Base
  enum :delivery_shift => [:morning, :afternoon, :evening]
  belongs_to :origin_address, class_name: 'Address'
  belongs_to :destination_address, class_name: 'Address'
  belongs_to :load_step, class_name: 'RoutingStep'
  belongs_to :unload_step, class_name: 'RoutingStep'

  def origin_address_name
    origin_address.nil? ? nil : origin_address.name
  end

  def destination_address_name
    destination_address.nil? ? nil : destination_address.name
  end

  def load_time
    load_step.nil? ? nil : load_step.delivery_time
  end

  def unload_time
    unload_step.nil? ? nil : unload_step.delivery_time
  end

  def not_in_list?
    load_step.nil? || unload_step.nil?
  end
end
