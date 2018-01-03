json.extract! event, :id, :event_id, :title, :price, :managing_employee, :max_guests_per_person, :max_attending, :event_date, :created_at, :updated_at
json.url event_url(event, format: :json)
