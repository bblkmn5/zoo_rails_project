class CommentSerializer < ActiveModel::Serializer
  attributes :id, :notes, :animal_id
  belongs_to :animal
end
