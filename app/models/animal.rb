class Animal < ApplicationRecord
    belongs_to :zoo
    has_many :keepers, through: :zoo
    
end
