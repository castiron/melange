class AccountSerializer < ActiveModel::Serializer
  attributes :id, :name, :primary_contact_id, :active, :balance
end
