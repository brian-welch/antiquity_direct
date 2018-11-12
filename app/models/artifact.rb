class Artifact < ApplicationRecord
  has_many :bookings
  belongs_to :cultural_origin
  belongs_to :time_period
  belongs_to :artifact_type
end
