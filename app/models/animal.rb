class Animal < ApplicationRecord
    belongs_to :zoo
    has_many :animal_keepers
    has_many :keepers, through: :animal_keepers
    
end
