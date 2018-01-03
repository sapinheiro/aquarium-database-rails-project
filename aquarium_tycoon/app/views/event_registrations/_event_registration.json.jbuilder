json.extract! event_registration, :id, :registration_code, :time, :member, :event, :guest_count, :created_at, :updated_at
json.url event_registration_url(event_registration, format: :json)
