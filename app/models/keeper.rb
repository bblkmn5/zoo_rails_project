class Keeper < ApplicationRecord
    has_many :animal_keepers
    has_many :animals, through: :animal_keepers
    
    validates :name, presence: true
    validates :experience, presence: true 
end
