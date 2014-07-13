json.array!(@discrepancy_logs) do |discrepancy_log|
  json.extract! discrepancy_log, :id, :user_id, :song_name, :artist, :word, :cd_number, :button_pressed
  json.url discrepancy_log_url(discrepancy_log, format: :json)
end
