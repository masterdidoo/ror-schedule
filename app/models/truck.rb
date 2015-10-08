class Truck < ActiveRecord::Base
  belongs_to :start_address, class_name: "Address"
end
