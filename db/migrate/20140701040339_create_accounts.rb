class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.integer :primary_contact_id
      t.boolean :active
      t.decimal :balance

      t.timestamps
    end
  end
end
