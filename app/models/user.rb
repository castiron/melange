class User < ActiveRecord::Base

  # Validations
  # Nota Bene: email and password validation is coming from Devise :validatable

  # Concerns
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable




end
