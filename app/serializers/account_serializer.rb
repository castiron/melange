class AccountSerializer < ActiveModel::Serializer
  attributes :id, :name, :primary_contact_id, :active, :balance, :is_individual, :created_at, :updated_at
end
