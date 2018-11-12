class Artifact < ApplicationRecord
  belongs_to :cultural_origins
  belongs_to :artifact_types
  belongs_to :time_periods
end
