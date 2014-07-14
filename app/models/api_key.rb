class ApiKey < ActiveRecord::Base

  belongs_to :user
  include Tokenable

  validates :user_id, :ip_address, presence: true
end
