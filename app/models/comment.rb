# Model for Comment migration
class Comment < ApplicationRecord
  belongs_to :animal
end
