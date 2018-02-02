class Zoo < ApplicationRecord
    belongs_to :user
    has_many :animal_keepers
    has_many :animals, through: :animal_keepers
    has_many :keepers, through: :animal_keepers
    
end
