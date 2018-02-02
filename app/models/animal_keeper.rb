class AnimalKeeper < ApplicationRecord
    belongs_to :animal
    belongs_to :keeper
    belongs_to :user
end
