require 'date'

class Booking < ApplicationRecord
  belongs_to :artifact
  belongs_to :user

  validate :valid_dates
  validate :self_booking_check

  def valid_dates
    if check_out_date.present? && check_out_date < Date.today
      errors.add(:base, "You cannot travel back in time!")
    elsif return_date.present? && return_date <= (Date.today + 7)
      errors.add(:base, "You must commit to rent an artifact for at least 7 days")
    end
  end

  def self_booking_check
    # raise
    if user.artifacts.ids.include?(:artifact_id)
      errors.add(:base, "You cannot book your own artifact.")
    end
  end
end
