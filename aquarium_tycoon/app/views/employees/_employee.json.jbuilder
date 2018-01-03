json.extract! employee, :id, :employee_id, :first_name, :last_name, :hired_date, :fired_date, :salary, :created_at, :updated_at
json.url employee_url(employee, format: :json)
