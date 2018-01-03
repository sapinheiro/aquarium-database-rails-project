json.extract! member, :id, :member_id, :first_name, :last_name, :date_joined, :expiration_date, :fee, :created_at, :updated_at
json.url member_url(member, format: :json)
