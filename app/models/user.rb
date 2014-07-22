require 'bcrypt'
class User < ActiveRecord::Base

  has_many :api_keys

  include Authenticatable
  validates :email, :first_name, :last_name, presence: true
  validates :email, uniqueness: true

end
