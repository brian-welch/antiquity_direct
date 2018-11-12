class Artifact < ApplicationRecord
  belongs_to :cultural_origin
  belongs_to :artifact_type
  belongs_to :time_period
end
