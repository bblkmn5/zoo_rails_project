class Keeper < ApplicationRecord
    belongs_to :zoo
    has_many :animals, through: :zoo
    has_many :comments

    validates :name, presence: true 
end
