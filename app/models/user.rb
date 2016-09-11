class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]
  after_create :send_notification

  has_many :projects
  has_many :products

def self.find_for_facebook_oauth(auth)
	user = User.where(provider: auth.provider, uid: auth.uid).first
	# The User was found in our database
	return user if user
	# Check if the User is already registered without Facebook
	user = User.where(email: auth.info.email).first
	return user if user
	User.create(
	name: auth.extra.raw_info.name,
	provider: auth.provider, uid: auth.uid,
	email: auth.info.email,
	password: Devise.friendly_token[0,20])
end

def is_admin?
  	self.role == "admin"
end

  mount_uploaders :avatars, AvatarUploader

  private

  def send_notification
    UserMailer.welcome(id).deliver_now
  end

end
