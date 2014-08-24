class AddIsIndividualToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :is_individual, :boolean
  end
end
