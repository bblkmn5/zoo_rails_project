# Model for Zoo migration
class Zoo < ApplicationRecord
  has_many :users
  has_many :animals
  has_many :keepers

  validates :name, uniqueness: true

  def animals_attributes=(animals_attributes)
    animals_attributes.each do |_i, animal_attributes|
      self.animals.build(animal_attributes)
    end
  end

  def keepers_attributes=(keepers_attributes)
    keepers_attributes.each do |_i, keeper_attributes|
      self.keepers.build(keeper_attributes)
    end
  end

  def self.all_except(user)
    where.not(id: user)
  end

  def animal_capacity_reached?
    self.animals.count >= self.animal_capacity
  end

  def keeper_capacity_reached?
    self.keepers.count >= self.keeper_capacity
  end
end
