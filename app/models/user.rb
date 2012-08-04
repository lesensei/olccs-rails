class User < ActiveRecord::Base
  has_many :rules

  def self.from_omniauth(auth)
    where(auth.slice("provider","uid")).first_or_create! do |user|
      user.provider = auth[:provider]
      user.uid = auth[:uid]
      user.name = auth[:info][:name]
    end
  end
end