json.array!(@dj_applications) do |dj_application|
  json.extract! dj_application, :id, :show_name, :bands_or_artists_played, :show_genre, :show_blurb, :training_time
  json.url dj_application_url(dj_application, format: :json)
end
