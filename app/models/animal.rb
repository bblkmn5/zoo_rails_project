class Animal < ApplicationRecord
    belongs_to :zoo
    has_many :keepers, through: :zoo
    has_many :comments

    validates :name, presence: true
    validates_uniqueness_of :name, scope: :species
    accepts_nested_attributes_for :comments
    
    # def keepers_attributes=(keepers_attributes)
    #     keepers_attributes.each do |keeper_attributes|
    #         self.keepers.build(keeper_attributes)
    #     end
    # end
    
    # def feed_animal_count
    #     feed_integer = 0
    #     if self.last_fed == nil
    #         feed_integer
    #     else
    #         animal_time = self.last_fed.strftime("%H").to_i
    #         time = Time.now.strftime("%H").to_i
    #         since_fed = time - animal_time
    #         if (since_fed >= 24) 
    #             feed_integer = 4
    #         elsif (since_fed >= 18)
    #             feed_integer = 3
    #         elsif (since_fed >= 12)
    #             feed_integer = 2
    #         else
    #             feed_integer = 1 
    #         end
    #     end
    # end

    # def feed_animal_message
    #     if feed_integer == 0
    #         "Oh no! #{self.name} has never been fed! Feed it NOW!"
    #     elsif feed_integer == 1
    #         "It looks like #{self.name} isn't hungry. Keep up the good work!"
    #     elsif feed_integer == 2
    #         "It's time to feed #{self.name}!"
    #     elsif feed_integer == 3
    #         "Looks like you haven't fed #{self.name} today. #{self.name} might still like you if you feed right now!"
    #     elsif feed_integer == 4
    #         "You haven't fed #{self.name} in over #{since_fed} hours. Do you even care??"
    #     else
    #         "Hm.. Something isn't right."
    #     end
    # end

    # def clean_animal_count
    #     clean_integer = 0
    #     if self.last_cleaned == nil
    #         clean_integer
    #     else
    #         animal_time = self.last_cleaned.strftime("%H").to_i
    #         time = Time.now.strftime("%H").to_i
    #         since_cleaned = time - animal_time
    #         if (since_cleaned >= 72)
    #             clean_integer = 4
    #         elsif (since_cleaned >= 36)    
    #             clean_integer = 3
    #         elsif (since_cleaned >= 24)
    #             clean_integer = 2
    #         else
    #             clean_integer = 1
    #         end
    #     end
    # end

    # def clean_animal_message(clean_animal_count)
    #     if clean_integer == 0
    #         "Oh no! #{self.name} has never been cleaned! Gross! Clean them NOW!"
    #     elsif clean_integer == 1
    #         "It looks like #{self.name} isn't dirty. Keep up the good work!"
    #     elsif clean_integer == 2
    #         "It's time to clean #{self.name}!"
    #     elsif clean_integer == 3
    #         "It's been #{since_cleaned} hours. Have you cleaned #{self.name} today?"
    #     elsif clean_integer == 4
    #         "You haven't cleaned #{self.name} in over #{since_cleaned} hours. Do you even care??"
    #     else
    #         "Hm.. something weird is going on."
    #     end
    # end

end
