class User < ActiveRecord::Base
  attr_accessible :password, :username
  validates :username, presence: true, uniqueness: true
  validates :password, length: {minimum: 6, allow_nil: true}

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
  end

  def is_password?(pass)
    BCrypt::Password.new(self.password_digest).is_password?(pass)
  end


end
