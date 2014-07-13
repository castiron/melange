class AddLastSeenAtToApiKeys < ActiveRecord::Migration
  def change
    add_column :api_keys, :last_seen_at, :datetime
  end
end
