class User < ActiveRecord::Base
  # activate our methods
  has_secure_password  validations: false

  validates :email , presence: true,  uniqueness: true
  validates :password , presence: true,  on: :create , length: {minimum: 5}

end
