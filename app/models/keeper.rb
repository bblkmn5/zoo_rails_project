class Keeper < ApplicationRecord
    has_many :animals
    validates :name, presence: true
    validates :experience, presence: true 
end
