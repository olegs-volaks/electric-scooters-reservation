class Employee < ApplicationRecord

  has_many :reservations
  has_many :scooters, through: :reservations

  validates :last_name, :first_name, presence: true
  validates :email, presence: true, uniqueness: true

  def name
    "#{self.first_name} #{self.last_name}"
  end

  ransacker :full_name, formatter: proc { |v| v.mb_chars.downcase.to_s } do |parent|
    Arel::Nodes::NamedFunction.new('LOWER',
                                   [Arel::Nodes::NamedFunction.new('concat_ws',
                                                                   [Arel::Nodes::SqlLiteral.new("' '"), parent.table[:first_name], parent.table[:last_name]])])
  end
end