# Model for Comment migration
class Comment < ApplicationRecord
  belongs_to :animal
  belongs_to :keeper
end