json.extract! user, :id, :email, :first_name, :mid_name, :last_name, :designation_id, :department, :project_id, :password_digest, :role, :created_at, :updated_at
json.url user_url(user, format: :json)