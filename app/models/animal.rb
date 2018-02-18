class Animal < ApplicationRecord
    belongs_to :zoo
    has_many :keepers, through: :zoo

    validates_uniqueness_of :name, scope: :species
    
    def feed_animal
        animal_time = self.last_fed.strftime("%H")
        time = Time.now.strftime("%H")
        if ((time - animal_time) >= 24) 
            flash[:alert] = "It's time to feed #{self.name}!"
        elsif ((time - animal_time) >= 18)
            flash[:alert] = "You haven't fed #{self.name} in over 18 hours. Do you even care??"
        elsif ((time - animal_time) >= 12)
            flash[:alert] = "It's been 12 hours. Have you fed #{self.name} today?"
        elsif ((time - animal_time) >= 6)
            flash[:alert] = "It's time to feed #{self.name}!"
        else
            flash[:notice] = "It looks like #{self.name} isn't hungry. Keep up the good work!"
        end
        
    end

    def clean_animal

    end

    def frequency
    end
end
