class Animal < ApplicationRecord
    has_many :animal_keepers
    has_many :keepers, through: :animal_keepers
    
end
