json.array!(@shows) do |show|
  json.extract! show, :id, :name, :user_id, :start_time, :stop_time, :day_of_week
  json.url show_url(show, format: :json)
end
