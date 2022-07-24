class Scooter < ApplicationRecord

  acts_as_paranoid

  has_many :reservations, dependent: :destroy
  has_many :employees, through: :reservations

  validates :number, presence: true, uniqueness: true

  def name
    self.number
  end
end
