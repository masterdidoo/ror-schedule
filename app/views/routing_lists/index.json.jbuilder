json.array!(@routing_lists) do |routing_list|
  json.extract! routing_list, :id, :delivery_date, :delivery_shift, :driver_id
  json.url routing_list_url(routing_list, format: :json)
end
