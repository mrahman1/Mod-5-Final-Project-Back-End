class JobStage < ApplicationRecord
  belongs_to :job
  belongs_to :stage
end
