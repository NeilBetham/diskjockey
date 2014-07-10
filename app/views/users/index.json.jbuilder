json.array!(@users) do |user|
  json.extract! user, :id, :email, :phone, :phone_carrier, :google_api_token, :role
  json.url user_url(user, format: :json)
end
