json.array!(@orders) do |order|
  json.extract! order, :id, :number, :delivery_date, :delivery_shift, :volume, :handling_unit_quantity, :load_time, :unload_time
  json.url order_url(order, format: :json)
end
