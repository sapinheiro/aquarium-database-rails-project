json.extract! feeding_log, :id, :feeding_id, :time, :food, :quantity, :employee_id, :tank_id, :created_at, :updated_at
json.url feeding_log_url(feeding_log, format: :json)
