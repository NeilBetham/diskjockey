class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :phone, :phone_carrier, :relevant_experience, :role, :employment_status, :station_staff, :google_api_token
end
