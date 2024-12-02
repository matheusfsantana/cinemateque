class Role < ApplicationRecord
  belongs_to :movie
  belongs_to :actor
  validates :name, presence: true

end
