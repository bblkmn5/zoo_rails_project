# Model for Keeper migration
class Keeper < ApplicationRecord
  belongs_to :zoo
  has_many :animals, through: :zoo

  validates :name, presence: true
end
