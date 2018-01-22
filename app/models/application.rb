class Application < ApplicationRecord
  belongs_to :job
  belongs_to :candidate
  belongs_to :stage
end
