class ShowSerializer < ActiveModel::Serializer
  attributes :id, :name, :start_time, :stop_time, :day_of_week
  has_one :user
end
