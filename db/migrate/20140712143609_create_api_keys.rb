class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.string :token
      t.datetime :expires_at
      t.integer :user_id
      t.integer :refresh_count, :default => 0
      t.string :ip_address

      t.timestamps
    end
    add_index :api_keys, :token, :unique => true
  end
end
