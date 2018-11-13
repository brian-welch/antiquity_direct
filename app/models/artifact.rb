class Artifact < ApplicationRecord
  has_many :bookings
  belongs_to :cultural_origin
  belongs_to :time_period
  belongs_to :artifact_type
  belongs_to :condition

  validates :name, uniqueness: true, presence: true
  validates :price, presence: true
  validates :photo, presence: true
  validates :cultural_origin_id, presence: true
  validates :time_period_id, presence: true
  validates :artifact_type_id, presence: true
  validates :condition_id, presence: true
end
