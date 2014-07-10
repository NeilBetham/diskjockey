class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :phone, :phone_carrier, :google_api_token, :role
end
