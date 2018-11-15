require 'date'

class Booking < ApplicationRecord
  belongs_to :artifact
  belongs_to :user

  validate :valid_dates

  def valid_dates
    if check_out_date.present? && check_out_date <= Date.today
      errors.add(:check_out_date, "You cannot travel back in time!")
    elsif check_out_date.present? && check_out_date <= (Date.today + 7)
      errors.add(:return_date, "You must commit to rent an artifact for at least 7 days")
    end
  end
end
