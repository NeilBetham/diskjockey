json.array!(@users) do |user|
  json.extract! user, :id, :username, :email, :phone, :phone_carrier, :google_api_token
  json.url user_url(user, format: :json)
end
