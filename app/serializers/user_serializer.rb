class UserSerializer < ActiveModel::Serializer
  attributes :email, :first_name, :last_name, :current_sign_in_at, :last_sign_in_at, :created_at, :updated_at
end
