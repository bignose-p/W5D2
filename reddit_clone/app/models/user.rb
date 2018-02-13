# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  session_token   :string
#  username        :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  after_initialize :ensure_session_token
  validates :username, uniqueness: true
  validates :session_token, :username, presence: true 
  validates :password, length: {minimum: 6, allow_nil: true }
  
  has_many :subs
  has_many :posts 
  has_many :comments
  
  attr_reader :password 
  
  def self.generate_session_token
    SecureRandom.urlsafe_base64
  end
  
  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return user if user && user.is_password?(password)
    nil 
  end 
  
  def ensure_session_token 
    self.session_token ||= User.generate_session_token
  end 
  
  def reset_session_token 
    self.session_token = User.generate_session_token
    self.save! 
    self.session_token 
  end 
  
  def password=(password)
    @password = password 
    self.password_digest = BCrypt::Password.create(password)
  end
  
  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end 
  
end
