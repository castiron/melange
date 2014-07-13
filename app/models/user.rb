require 'bcrypt'
class User < ActiveRecord::Base

  include Authenticatable
  validates :email, :first_name, :last_name, presence: true
  validates :email, uniqueness: true
end
