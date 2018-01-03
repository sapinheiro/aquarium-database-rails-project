json.extract! treatment_log, :id, :treatment_id, :time, :medicine, :quantity, :employee_id, :animal_id, :created_at, :updated_at
json.url treatment_log_url(treatment_log, format: :json)
