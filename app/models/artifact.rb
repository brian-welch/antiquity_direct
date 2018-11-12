class Artifact < ApplicationRecord
  belongs_to :cultural_origin
  belongs_to :time_period
  belongs_to :artifact_type
  belongs_to :condition
end
