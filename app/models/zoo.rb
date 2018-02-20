class Zoo < ApplicationRecord
    belongs_to :user
    has_many :animals
    has_many :keepers

    validates :name, uniqueness: true
    

    def users_attributes=(users_attributes)
        users_attributes.values.each do |user_attributes|
            self.users.build(user_attributes)
        end
    end
    
    def self.all_except(user)
        where.not(id: user)
    end

    def animal_capacity_reached?
        self.animals.count >= self.animal_capacity ? true : false
    end

    def keeper_capacity_reached?
        self.keepers.count >= self.keeper_capacity ? true : false
    end
end
