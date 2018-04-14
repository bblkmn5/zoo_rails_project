class AnimalSerializer < ActiveModel::Serializer
  attributes :id, :name, :species, :personality
  belongs_to :zoo
  has_many :comments
end
