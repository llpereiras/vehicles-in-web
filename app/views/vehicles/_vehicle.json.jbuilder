json.extract! vehicle, :id, :name, :maker_id, :type, :created_at, :updated_at
json.url vehicle_url(vehicle, format: :json)