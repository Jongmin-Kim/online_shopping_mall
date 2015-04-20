class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { minimum: 5, maximum: 16 }
  validates :email, presence: true, length: { maximum: 30 }, uniqueness: { case_sensitive: false }
  validates :email, :email_format => { :message => 'is not looking good' }
  validates :password, length: { minimum: 6 }
  has_secure_password
end
