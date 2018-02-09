class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    has_one :zoo
    has_many :animal_keepers
    has_many :animals, through: :animal_keepers
    has_many :keepers, through: :animal_keepers

    validates :email, uniqueness: true
    
end
