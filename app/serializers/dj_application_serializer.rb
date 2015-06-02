class DjApplicationSerializer < ActiveModel::Serializer
  attributes :id, :show_name, :bands_or_artists_played, :show_blurb, :training_time
end
