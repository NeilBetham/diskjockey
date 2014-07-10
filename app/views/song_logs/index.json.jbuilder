json.array!(@song_logs) do |song_log|
  json.extract! song_log, :id, :cd_number, :song_name, :artist, :genre, :album, :score, :location, :user_id
  json.url song_log_url(song_log, format: :json)
end
