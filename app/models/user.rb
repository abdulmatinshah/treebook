class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :profile_name, presence: true,
                            uniqueness: true,
                            format: {with: /[a-zA-Z0-9_]+/, messages: 'Must beformatted correctly.'}


  has_many :statuses

  def full_name
    "#{first_name} #{last_name}"
  end
  def gravatar_url
    "http://www.gravatar.com/avatar/#{hash_email}"
  end
  private
  def hash_email
    sanitized_email = email.strip.downcase
    Digest::MD5.hexdigest(sanitized_email)
  end
end
