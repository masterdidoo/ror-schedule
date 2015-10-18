class RoutingList < ActiveRecord::Base
  enum :delivery_shift => [:morning, :afternoon, :evening]
  belongs_to :driver
  has_many :routing_steps, inverse_of: :routing_list, dependent: :nullify

  def driver_name
    driver.nil? ? nil : driver.name
  end
end
