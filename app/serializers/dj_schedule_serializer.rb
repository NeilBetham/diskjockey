class DjScheduleSerializer < ActiveModel::Serializer
  attributes :id, :start_date, :stop_date
end
