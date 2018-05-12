# Model for Comment migration
class Comment < ApplicationRecord
  belongs_to :animal

  validates :notes, presence: true 
  validates_uniqueness_of :notes, scope: :animal
end
