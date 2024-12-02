class Actor < ApplicationRecord
  validates :name, :birth_date, :nacionality, presence: true
  has_many :roles
end
