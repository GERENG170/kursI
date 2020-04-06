class User < ApplicationRecord
  acts_as_voter
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
         has_many :colls
         has_many :dops
         devise :omniauthable, omniauth_providers: [:facebook, :github]

   
     
          def active_for_authentication?
            super && !deactivated
          end

          def self.from_omniauth(auth)
            if @email = auth.info.email
              where(email: @email).first_or_create do |user|
                user.provider = auth.provider
                user.uid = auth.uid
                user.password = Devise.friendly_token[0, 20]
                user.name = auth.info.name   # assuming the user model has a name
              end
            else
               where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
                 user.email = "no@email"
                 user.password = Devise.friendly_token[0, 20]
                 user.name = auth.info.name   # assuming the user model has a name
               end
            end
        end
      end