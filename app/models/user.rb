class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

    has_many :zoos
    has_many :animals, through: :zoos
    has_many :keepers, through: :zoos

    validates :email, uniqueness: true

    def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.name = auth.info.name
        user.password = Devise.friendly_token[0, 20]
        user.image = auth.info.image
      end
    end 

    def zoo_attributes=(zoo_attributes)
        self.zoo = Zoo.where(:name => zoo_attributes[:name]).first_or_create do |z|
              z.animal_capacity = zoo_attributes[:animal_capacity]
              z.keeper_capacity = zoo_attributes[:keeper_capacity]
        end
    end
end
