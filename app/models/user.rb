class User < ActiveRecord::Base
  authenticates_with_sorcery!
  validates_confirmation_of :password, Message: "Both fields must coincide"
  attr_accessible  :username, :email, :password, :password_confirmation
  has_many :posts
end
