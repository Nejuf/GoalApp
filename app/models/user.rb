class User < ActiveRecord::Base
  attr_accessible :password, :username
  attr_reader :password

  validates :username, presence: true, uniqueness: true
  validates :password, length: {minimum: 6, allow_nil: true}


  after_initialize :ensure_session_token

  has_many :goals
  has_many :cheers

  def self.find_by_credentials(uname, pwd)
    @user = User.find_by_username(uname)
    if @user.nil? || !@user.is_password?(pwd)
      nil
    else
      @user
    end
  end

  def password=(pass)
    self.password_digest = BCrypt::Password.create(pass)
    @password = pass
  end

  def is_password?(pass)
    BCrypt::Password.new(self.password_digest).is_password?(pass)
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save!
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end
end
