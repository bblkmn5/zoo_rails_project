class Animal < ApplicationRecord
    belongs_to :zoo
    has_many :keepers, through: :zoo

    validates_uniqueness_of :name, scope: :species
    
end
