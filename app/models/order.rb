class Order < ActiveRecord::Base
  enum delivery_shift: [:morning, :afternoon, :evening]
  belongs_to :origin_address, class_name: 'Address'
  belongs_to :destination_address, class_name: 'Address'
end
