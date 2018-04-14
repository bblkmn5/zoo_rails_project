class AnimalSerializer < ActiveModel::Serializer
  attributes :id, :name, :species, :personality
  has_many :comments
end
