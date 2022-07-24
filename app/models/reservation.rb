class Reservation < ApplicationRecord

  acts_as_paranoid

  belongs_to :employee
  belongs_to :scooter

  validates :from, :to, presence: true, :overlap => { scope: :scooter_id }
  validates :to, comparison: { greater_than: :from }
  validates :from, comparison: { greater_than: DateTime.now }

  after_create :send_email

  private

  def period_validate
    if Reservation.where(scooter_id: self.scooter_id)
                  .where('reservations.from BETWEEN :from AND :to OR reservations.to BETWEEN :from AND :to', from: self.from, to: self.to).any?
      self.errors.add(:from, :reserved)
      self.errors.add(:to, :reserved)
    end
  end

  def send_email
    if self.employee.subscribe? && (self.from - 1.days) > DateTime.now
      verifier = ActiveSupport::MessageVerifier.new(Employee.secure_key)
      unsubscribe_token = verifier.generate(self.employee_id)
      NotificationMailer.notification(self.id, unsubscribe_token).deliver_later(wait_until: self.from - 1.days)
    end
  end

end
