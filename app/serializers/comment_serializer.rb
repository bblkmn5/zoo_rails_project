class CommentSerializer < ActiveModel::Serializer
  attributes :id, :notes
  belongs_to :animal
end
