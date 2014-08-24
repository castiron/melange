class Account < ActiveRecord::Base

  include Orderable
  @valid_orderings = [:created_at, :updated_at, :name, :balance, :id]

end
