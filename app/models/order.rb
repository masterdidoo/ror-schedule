class Order < ActiveRecord::Base
  enum delivery_shift: [:morning, :afternoon, :evening]
  belongs_to :origin_point, class_name: 'Point'
  belongs_to :destination_point, class_name: 'Point'
end
