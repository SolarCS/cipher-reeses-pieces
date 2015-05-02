class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :password, length: { minimum: 6 }, allow_nil: true

  has_many :movies

  def authenticate(password)
    return false unless user = super(password)
    user.create_token! if user.auth_token.nil?
    user
  end

  def authenticate_with_token(token)
    return false if token.nil?
    self.auth_token == token ? self : false
  end

  def create_token!
    token = SecureRandom.urlsafe_base64(nil, false)
    update_attribute :auth_token, token
  end

  def destroy_token!
    update_attribute :auth_token, nil
  end

  def has_movie?(movie)
    return movies.find_by_name(movie.name) != nil
  end

  def add_movie(movie)
    movies << movie
  end
end
