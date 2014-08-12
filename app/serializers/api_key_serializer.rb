class ApiKeySerializer < ActiveModel::Serializer
  attributes :token, :expires_at, :refresh_count
  has_one :user
end
