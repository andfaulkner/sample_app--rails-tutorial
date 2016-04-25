require 'bcrypt'

class User < ActiveRecord::Base
  attr_accessible 	:email, :name, :password, :password_confirmation, :poo

  VALID_EMAIL_REGEX = /\A([^@\s\.]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  # generally don't do this
  before_save { self.email = email.downcase }

  validates :name, 	presence: 	true,
  									length: 		{ maximum: 50 }
  validates :email, presence: 	true,
  									length: 		{ maximum: 255 },
     								format: 		{ with: VALID_EMAIL_REGEX, message: "valid email required" },
     								uniqueness: { case_sensitive: false }

  validates :password, 					    length: { minimum: 6 },
   																	presence: true,
   																	format: { with: /\A[^ ]*\z/i }
  validates :password_confirmation, length: { minimum: 6 },
  																	presence: true,
  																	format: { with: /\A[^ ]*\z/i }

  has_secure_password

  # 
  # @param string {String} to be hashed
  # 
  def User.digest string

    cost = 20
    # ActiveModel::SecurePassword.min cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create string, cost: cost
  end

end