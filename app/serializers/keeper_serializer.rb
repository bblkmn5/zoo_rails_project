class KeeperSerializer < ActiveModel::Serializer
  attributes :id, :name
  belongs_to :zoo
end
