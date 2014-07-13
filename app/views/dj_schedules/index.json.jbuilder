json.array!(@dj_schedules) do |dj_schedule|
  json.extract! dj_schedule, :id, :start_date, :stop_date
  json.url dj_schedule_url(dj_schedule, format: :json)
end
