# Model for Comment migration
class Comment < ApplicationRecord
  belongs_to :animal

  validates :notes, presence: true, uniqueness: true
end
