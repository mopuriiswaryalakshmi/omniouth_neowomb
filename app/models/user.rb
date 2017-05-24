class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         validates_presence_of :username

         has_many :reviews

         has_many :permissions
         has_many :roles, through: :permissions

         after_create :generate_role

         def role?(role)
         	self.roles.pluck(:name).include? role 
         end

         def generate_role
         	Permission.create(user_id: self.id, role_id: Role.last.id)
         end

         def self.from_omniauth(auth)
            where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
                user.provider = auth.provider
                user.uid = auth.uid
                user.username = auth.info.username
                user.oauth_token = auth.credentials.token
                user.oauth_expires_at = Time.at(auth.credentials.expires_at)
                user.save!
            end
         end

end
