class ZooSerializer < ActiveModel::Serializer
  attributes :id, :name, :animal_id, :user_id, :keeper_id
  has_many :animals
  has_many :keepers
end
