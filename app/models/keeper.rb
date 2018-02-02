class Keeper < ApplicationRecord
    belongs_to :zoo
    has_many :animal_keepers
    
    validates :name, presence: true 
end
