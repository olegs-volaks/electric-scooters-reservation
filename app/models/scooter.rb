class Scooter < ApplicationRecord
  has_many :reservations
  has_many :employees, through: :reservations

  validates :number, presence: true, uniqueness: true

  def name
    self.number
  end
end
