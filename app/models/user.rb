class User < ApplicationRecord
    has_one :zoo
    has_many :animal_keepers
    has_many :animals, through: :animal_keepers
    has_many :keepers, through: :animal_keepers

    has_secure_password
end
