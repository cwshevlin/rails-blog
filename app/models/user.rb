class User < ActiveRecord::Base

  include BCrypt

  has_secure_password
  has_many :posts, foreign_key: :author_id

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end

  def authenticate(username, input_password)
    user = User.find_by_username(username)
    if user && user.password == input_password
      return user
    else
      return false
    end
  end

end
