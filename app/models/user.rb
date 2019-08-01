class User < ApplicationRecord
  devise :database_authenticatable, :recoverable, :trackable, :validatable, :omniauthable, omniauth_providers: [:sso]

  def self.from_sso(auth)
    where(username: auth.info[:username]).first_or_create do |user|
      user.email        = auth.info.email
      user.username     = auth.info.username
      user.nome         = "#{auth.extra.first_name} #{auth.extra.last_name}"
      user.password     = Devise.friendly_token[0,20]
    end
  end
end
