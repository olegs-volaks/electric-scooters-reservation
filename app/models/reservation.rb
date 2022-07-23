class Reservation < ApplicationRecord

  belongs_to :employee
  belongs_to :scooter

  validates :from, :to, presence: true, :overlap => { scope: :scooter_id }
  validates :to, comparison: { greater_than: :from }

  private

  def period_validate
    if Reservation.where(scooter_id: self.scooter_id)
                  .where('reservations.from BETWEEN :from AND :to OR reservations.to BETWEEN :from AND :to', from: self.from, to: self.to).any?
      self.errors.add(:from, :reserved)
      self.errors.add(:to, :reserved)
    end
  end
end
