class DiscrepancyLogSerializer < ActiveModel::Serializer
  attributes :id, :song_name, :artist, :word, :cd_number, :button_pressed
  has_one :user
end
