require 'date'

class Booking < ApplicationRecord
  belongs_to :artifact
  belongs_to :user

  validate :valid_dates

  def valid_dates
    if check_out_date.present? && check_out_date < Date.today
      errors.add(:check_out_date, " should not be in the past!")
    elsif return_date.present? && return_date <= (Date.today + 7)
      errors.add(:base, "You must commit to rent an artifact for at least 7 days")
    end
  end
end
